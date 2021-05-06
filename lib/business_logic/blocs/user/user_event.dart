part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class CreateUserAccountEvent extends UserEvent {
  final String uid;

  CreateUserAccountEvent({@required this.uid});
}

class GetUserDetailsEvent extends UserEvent {
  final String uid;

  GetUserDetailsEvent({@required this.uid});
}

class AddIntrestsEvent extends UserEvent {
  final List<String> intrests;
  final String uid;

  AddIntrestsEvent({@required this.intrests, @required this.uid});
}

class AddSavesEvent extends UserEvent {
  final List<String> articleIds;
  final String uid;

  AddSavesEvent({@required this.articleIds, @required this.uid});
}

class RemoveIntrestsEvent extends UserEvent {
  final String userId;
  final List<String> intrests, stores;

  RemoveIntrestsEvent({@required this.userId, @required this.intrests, @required this.stores});
}

class RemoveSavesEvent extends UserEvent {
  final String userId;
  final List<String> articleIds, stores;

  RemoveSavesEvent({@required this.userId, @required this.articleIds, @required this.stores});
}
