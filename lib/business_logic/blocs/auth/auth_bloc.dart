import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/user_repository.dart';

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
          var currentUser = await userRepository.getCurrentUser();

          yield Authenticated(user: currentUser);
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

        try {
          if (user != null) {
            var exist = await userRepository.isUserExists(user.uid);

            if (exist) {
              yield SignInSuccessfull(user: user, isExists: exist);
            } else {
              yield SignInSuccessfull(user: user, isExists: exist);
            }
          }
        } catch (e) {
          yield SignInFailed(message: "Exception: " + e.toString());
        }
      } catch (e) {
        yield SignInFailed(message: "Exception: " + e.toString());
      }
    } else if (event is SignOutEvent) {
      yield AuthLoading();
      try {
        await userRepository.signOutUser();
        yield SignOutSuccessfull();
      } catch (e) {
        yield SignOutFailed();
      }
    }
  }
}
