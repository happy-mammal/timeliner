import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/pages/auth.dart';
import 'package:timeliner/presentation/pages/home.dart';
import 'package:timeliner/presentation/pages/setup.dart';

class AppRoute {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthPage());
        break;
      case '/setup':
        return MaterialPageRoute(builder: (_) => SetupPage(data: args));
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage(data: args));
        break;

      default:
        return null;
        break;
    }
  }
}
