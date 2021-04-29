import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState(themeMode: ThemeMode.system));

  Future<void> getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isDark") != null) {
      prefs.getBool("isDark") ? emit(AppThemeState(themeMode: ThemeMode.dark)) : emit(AppThemeState(themeMode: ThemeMode.light));
    } else {
      emit(AppThemeState(themeMode: ThemeMode.system));
    }
  }

  Future<void> setAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      if (prefs.getBool("isDark") != null) {
        prefs.getBool("isDark") ? await prefs.setBool("isDark", false) : await prefs.setBool("isDark", true);
        getAppTheme();
      } else {
        await prefs.setBool("isDark", false);
        getAppTheme();
      }
    } catch (e) {
      emit(AppThemeState(themeMode: ThemeMode.system));
    }
  }
}
