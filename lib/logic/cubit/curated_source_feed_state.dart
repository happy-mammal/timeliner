part of 'curated_source_feed_cubit.dart';

@immutable
abstract class CuratedSourceFeedState {}

class CuratedSourceFeedInitial extends CuratedSourceFeedState {}

class CuratedSourceFeedLoading extends CuratedSourceFeedState {}

class CuratedSourceFeedSuccess extends CuratedSourceFeedState {
  final List data;

  CuratedSourceFeedSuccess({@required this.data});
}

class CuratedSourceFeedFailed extends CuratedSourceFeedState {
  final String message;

  CuratedSourceFeedFailed({@required this.message});
}
