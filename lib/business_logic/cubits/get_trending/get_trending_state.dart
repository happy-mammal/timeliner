part of 'get_trending_cubit.dart';

@immutable
abstract class GetTrendingState {}

class GetTrendingInitial extends GetTrendingState {}

class GetTrendingLoading extends GetTrendingState {}

class GetTrendingSuccess extends GetTrendingState {
  final List data;

  GetTrendingSuccess({@required this.data});
}

class GetTrendingFailed extends GetTrendingState {
  final String message;

  GetTrendingFailed({@required this.message});
}
