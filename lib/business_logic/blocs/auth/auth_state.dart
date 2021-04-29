part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({@required this.user});
}

class UnAuthenticated extends AuthState {}

class SignInSuccessfull extends AuthState {
  final User user;
  final bool isExists;

  SignInSuccessfull({@required this.user, @required this.isExists});
}

class SignInFailed extends AuthState {
  final String message;

  SignInFailed({@required this.message});
}
