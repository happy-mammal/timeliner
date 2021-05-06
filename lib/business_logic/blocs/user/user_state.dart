part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class CreateUserSuccessfull extends UserState {}

class AddIntrestsSuccessfull extends UserState {
  final List intrests;

  AddIntrestsSuccessfull({@required this.intrests});
}

class AddSavesSuccessfull extends UserState {
  final List articles;

  AddSavesSuccessfull({@required this.articles});
}

class RemoveIntrestsSuccessfull extends UserState {
  final List intrests;

  RemoveIntrestsSuccessfull({@required this.intrests});
}

class RemoveSavesSuccessfull extends UserState {
  final List articles;

  RemoveSavesSuccessfull({@required this.articles});
}

class GetUserDetailsSuccessfull extends UserState {
  final Map<String, dynamic> intrests;

  GetUserDetailsSuccessfull({@required this.intrests});
}

class CreateUserFailed extends UserState {}

class GetUserDetailsFailed extends UserState {}

class AddIntrestsFailed extends UserState {}

class AddSavesFailed extends UserState {}

class RemoveIntrestsFailed extends UserState {}

class RemoveSavesFailed extends UserState {}
