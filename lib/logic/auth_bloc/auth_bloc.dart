import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repository/UserRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;
  AuthBloc() : super(AuthInitial()) {
    this.userRepository = UserRepository();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      yield AuthLoading();
      try {
        var isSignedIn = await userRepository.isSignedIn();

        if (isSignedIn) {
          yield Authenticated();
        } else {
          yield UnAuthenticated();
        }
      } catch (e) {
        print("Exception Auth: " + e.toString());
        yield UnAuthenticated();
      }
    } else if (event is SignInEvent) {
      yield AuthLoading();
      try {
        var user = await userRepository.authWithGoogle();

        yield SignInSuccessfull(user: user);
      } catch (e) {
        yield SignInFailed(message: "Exception: " + e.toString());
      }
    } else if (event is SignOutEvent) {
      yield AuthLoading();
      try {
        await userRepository.signOutUser();
        yield SignOutSuccess();
      } catch (e) {
        await userRepository.signOutUser();
        yield SignOutFailed();
      }
    }
  }
}
