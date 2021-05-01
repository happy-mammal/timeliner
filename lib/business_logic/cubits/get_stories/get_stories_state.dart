part of 'get_stories_cubit.dart';

@immutable
abstract class GetStoriesState {}

class GetStoriesInitial extends GetStoriesState {}

class GetStoriesLoading extends GetStoriesState {}

class GetStoriesSuccess extends GetStoriesState {
  final List data;

  GetStoriesSuccess({@required this.data});
}

class GetStoriesFailed extends GetStoriesState {
  final String message;

  GetStoriesFailed({@required this.message});
}
