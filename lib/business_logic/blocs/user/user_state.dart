part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class CreateUserSuccessfull extends UserState {}

class CreateUserFailed extends UserState {}

class AddIntrestsSuccessfull extends UserState {
  final List intrests;

  AddIntrestsSuccessfull({@required this.intrests});
}

class AddIntrestsFailed extends UserState {}

class GetUserDetailsSuccessfull extends UserState {
  final List intrests;

  GetUserDetailsSuccessfull({@required this.intrests});
}

class GetUserDetailsFailed extends UserState {}
