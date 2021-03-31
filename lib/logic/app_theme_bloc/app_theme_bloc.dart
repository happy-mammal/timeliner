import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial());

  @override
  Stream<AppThemeState> mapEventToState(AppThemeEvent event) async* {
    if (event is GetAppThemeEvent) {
      yield AppThemeLoading();

      try {
        var theme = await _getAppTheme();
        yield AppThemeSuccess(themeMode: theme);
      } catch (e) {
        yield AppThemeFailed(themeMode: ThemeMode.system);
      }
    } else if (event is SetAppThemeEvent) {
      try {
        yield AppThemeLoading();
        var theme = await _setAppTheme();
        yield AppThemeSuccess(themeMode: theme);
      } catch (e) {
        yield AppThemeFailed(themeMode: ThemeMode.system);
      }
    }
  }

  Future<ThemeMode> _getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isDarkTheme = prefs.getBool('isDark') != null ? prefs.getBool('isDark') : false;
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  Future<ThemeMode> _setAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool('isDark') != null ? prefs.getBool('isDark') : false;

    isDark ? await prefs.setBool('isDark', false) : await prefs.setBool('isDark', true);

    var isDarkTheme = prefs.getBool('isDark') != null ? prefs.getBool('isDark') : false;

    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }
}
