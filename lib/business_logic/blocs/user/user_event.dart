part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class CreateUserAccountEvent extends UserEvent {
  final String uid, email, name, profile;

  CreateUserAccountEvent(this.uid, this.email, this.name, this.profile);
}

class AddIntrestsEvent extends UserEvent {
  final List<String> intrests;
  final String uid;

  AddIntrestsEvent(this.intrests, this.uid);
}

class GetUserDetailsEvent extends UserEvent {
  final String uid;

  GetUserDetailsEvent({@required this.uid});
}
