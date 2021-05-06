part of 'get_intrests_cubit.dart';

@immutable
abstract class GetIntrestsState {}

class GetIntrestsInitial extends GetIntrestsState {}

class GetIntrestsLoading extends GetIntrestsState {}

class GetIntrestsSuccess extends GetIntrestsState {
  final List data;

  GetIntrestsSuccess({@required this.data});
}

class GetIntrestsFailed extends GetIntrestsState {
  final String message;

  GetIntrestsFailed({@required this.message});
}

class GetIntrestsEmpty extends GetIntrestsState {
  GetIntrestsEmpty();
}
