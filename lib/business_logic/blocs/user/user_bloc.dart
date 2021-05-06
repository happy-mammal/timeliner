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
      yield UserLoading();
      try {
        var result = await userRepository.createUserAccount(event.uid);

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
          yield AddIntrestsSuccessfull(intrests: result);
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
        yield GetUserDetailsSuccessfull(intrests: result);
        print('GUDS');
      } catch (e) {
        yield GetUserDetailsFailed();
      }
    } else if (event is AddSavesEvent) {
      print("INSIDE SAVE EVENT");
      yield UserLoading();
      try {
        print("TRYING SAVE EVENT");
        var result = await userRepository.addSaves(event.articleIds, event.uid);

        if (result[0] != null) {
          print("RESULT-->" + result.toString());
          yield AddSavesSuccessfull(articles: result);
        } else {
          yield AddSavesFailed();
        }
      } catch (e) {
        print("EXCEPTION-->" + e.toString());
        yield AddSavesFailed();
      }
    } else if (event is RemoveIntrestsEvent) {
      yield UserLoading();
      try {
        var result = await userRepository.removeIntrests(event.intrests, event.userId, event.stores);

        if (result[0] != null) {
          yield RemoveIntrestsSuccessfull(intrests: result);
        } else {
          yield RemoveIntrestsFailed();
        }
      } catch (e) {
        yield RemoveIntrestsFailed();
      }
    } else if (event is RemoveSavesEvent) {
      yield UserLoading();

      try {
        var result = await userRepository.removeSaves(event.articleIds, event.userId, event.stores);
        print(result);
        if (result[0] != null) {
          print('not null');
          yield RemoveSavesSuccessfull(articles: result);
        } else {
          yield RemoveSavesFailed();
        }
      } catch (e) {
        yield RemoveSavesFailed();
      }
    }
  }
}
