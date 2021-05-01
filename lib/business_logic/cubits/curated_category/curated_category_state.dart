part of 'curated_category_cubit.dart';

@immutable
abstract class CuratedCategoryState {}

class CuratedCategoryInitial extends CuratedCategoryState {}

class CuratedCategoryLoading extends CuratedCategoryState {}

class CuratedCategorySuccess extends CuratedCategoryState {
  final List data;

  CuratedCategorySuccess({@required this.data});
}

class CuratedCategoryFailed extends CuratedCategoryState {
  final String message;

  CuratedCategoryFailed({@required this.message});
}
