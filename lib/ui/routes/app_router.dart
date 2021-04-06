import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/ui/screens/settings.dart';
import 'package:timeliner/ui/screens/viewarticle.dart';
import 'package:timeliner/ui/widgets/basic/bottom_navigator.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BottomNavigator(),
        );
      case '/home':
        return null;

      case '/feed':
        return null;

      case '/library':
        return null;

      case '/important':
        return null;

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );

      case '/viewarticle':
        return MaterialPageRoute(
          builder: (_) => ViewArticleScreen(),
        );

      default:
        return null;
    }
  }
}
