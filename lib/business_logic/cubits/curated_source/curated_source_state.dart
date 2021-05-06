part of 'curated_source_cubit.dart';

@immutable
abstract class CuratedSourceState {}

class CuratedSourceInitial extends CuratedSourceState {}

class CuratedSourceLoading extends CuratedSourceState {}

class CuratedSourceSuccess extends CuratedSourceState {
  final List data;

  CuratedSourceSuccess({@required this.data});
}

class CuratedSourceFailed extends CuratedSourceState {
  final String message;

  CuratedSourceFailed({@required this.message});
}
