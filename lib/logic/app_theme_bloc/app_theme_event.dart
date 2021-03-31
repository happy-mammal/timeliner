part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeEvent {}

class GetAppThemeEvent extends AppThemeEvent {}

class SetAppThemeEvent extends AppThemeEvent {}
