part of 'get_saved_articles_cubit.dart';

@immutable
abstract class GetSavedArticlesState {}

class GetSavedArticlesInitial extends GetSavedArticlesState {}

class GetSavedArticlesLoading extends GetSavedArticlesState {}

class GetSavedArticlesSuccess extends GetSavedArticlesState {
  final List articles;

  GetSavedArticlesSuccess({@required this.articles});
}

class GetSavedArticlesFailed extends GetSavedArticlesState {
  final String message;

  GetSavedArticlesFailed({@required this.message});
}
