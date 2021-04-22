part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class SignInSuccessfull extends AuthState {
  final User user;

  SignInSuccessfull({@required this.user});
}

class SignInFailed extends AuthState {
  final String message;

  SignInFailed({@required this.message});
}

class SignOutSuccess extends AuthState {}

class SignOutFailed extends AuthState {}
