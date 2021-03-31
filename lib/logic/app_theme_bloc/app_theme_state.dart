part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeState {}

class AppThemeInitial extends AppThemeState {}

class AppThemeLoading extends AppThemeState {}

class AppThemeSuccess extends AppThemeState {
  final ThemeMode themeMode;

  AppThemeSuccess({@required this.themeMode});
}

class AppThemeFailed extends AppThemeState {
  final ThemeMode themeMode;

  AppThemeFailed({@required this.themeMode});
}
