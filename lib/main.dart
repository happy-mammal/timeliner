import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/logic/bloc/app_theme_bloc.dart';
import 'package:timeliner/ui/routes/app_router.dart';
import 'package:timeliner/ui/themes/app_theme.dart';

void main() {
  runApp(TimeLiner());
}

class TimeLiner extends StatefulWidget {
  @override
  _TimeLinerState createState() => _TimeLinerState();
}

class _TimeLinerState extends State<TimeLiner> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeBloc>(create: (BuildContext context) => AppThemeBloc()..add(GetAppThemeEvent())),
      ],
      child: AppThemeSettings(),
    );
  }
}

class AppThemeSettings extends StatefulWidget {
  @override
  _AppThemeSettingsState createState() => _AppThemeSettingsState();
}

class _AppThemeSettingsState extends State<AppThemeSettings> {
  AppTheme _appTheme = AppTheme();
  AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        if (state is AppThemeInitial) {
          return materialApp(ThemeMode.system);
        } else if (state is AppThemeLoading) {
          return materialApp(ThemeMode.system);
        } else if (state is AppThemeSuccess) {
          return materialApp(state.themeMode);
        } else if (state is AppThemeFailed) {
          return materialApp(state.themeMode);
        } else {
          return materialApp(ThemeMode.system);
        }
      },
    );
  }

  Widget materialApp(ThemeMode themeMode) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appTheme.lightTheme(),
      darkTheme: _appTheme.darkTheme(),
      themeMode: themeMode,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
