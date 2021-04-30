import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc() : super(UserInitial()) {
    this.userRepository = UserRepository();
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is CreateUserAccountEvent) {
      print('INSIDE CUAE');
      yield UserLoading();
      try {
        print('TRYING CUAE');
        var result = await userRepository.createUserAccount(event.uid, event.name, event.email, event.profile);

        if (result != null) {
          yield CreateUserSuccessfull();
        } else {
          yield CreateUserFailed();
        }
      } catch (e) {
        yield CreateUserFailed();
      }
    } else if (event is AddIntrestsEvent) {
      yield UserLoading();
      try {
        var result = await userRepository.addIntrests(event.intrests, event.uid);

        if (result[0] != null) {
          yield AddIntrestsSuccessfull(intrests: result[0]["intrest"]);
        } else {
          yield AddIntrestsFailed();
        }
      } catch (e) {
        yield AddIntrestsFailed();
      }
    } else if (event is GetUserDetailsEvent) {
      yield UserLoading();
      try {
        var result = await userRepository.fetchUserDetails(event.uid);
        if (result != null) {
          yield GetUserDetailsSuccessfull(intrests: result[0]["intrest"]);
        } else {
          yield GetUserDetailsFailed();
        }
      } catch (e) {
        yield GetUserDetailsFailed();
      }
    }
  }
}
