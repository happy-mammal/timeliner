import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/pages/auth.dart';
import 'package:timeliner/presentation/pages/home.dart';

class AppRoute {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthPage());
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      default:
        return null;
        break;
    }
  }
}
