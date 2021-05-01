part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List data;

  SearchSuccess({@required this.data});
}

class SearchFailed extends SearchState {
  final String message;

  SearchFailed({@required this.message});
}
