import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  AppTheme _appTheme = AppTheme();
  AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme.lightTheme(),
      darkTheme: _appTheme.darkTheme(),
      themeMode: ThemeMode.light,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
