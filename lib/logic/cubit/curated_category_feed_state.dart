part of 'curated_category_feed_cubit.dart';

@immutable
abstract class CuratedCategoryFeedState {}

class CuratedCategoryFeedInitial extends CuratedCategoryFeedState {}

class CuratedCategoryFeedLoading extends CuratedCategoryFeedState {}

class CuratedCategoryFeedSuccess extends CuratedCategoryFeedState {
  final List data;

  CuratedCategoryFeedSuccess({@required this.data});
}

class CuratedCategoryFeedFailed extends CuratedCategoryFeedState {
  final String message;

  CuratedCategoryFeedFailed({@required this.message});
}
