import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/business_logic/cubits/curated_category/curated_category_cubit.dart';
import 'package:timeliner/business_logic/cubits/curated_source/curated_source_cubit.dart';
import 'package:timeliner/presentation/pages/auth.dart';
import 'package:timeliner/presentation/pages/home.dart';
import 'package:timeliner/presentation/pages/setup.dart';
import 'package:timeliner/presentation/pages/view_article.dart';

class AppRoute {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthPage());
        break;
      case '/setup':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
                ], child: SetupPage(data: args)));
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage(data: args));
        break;

      case '/viewarticle':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<CuratedCategoryCubit>(create: (BuildContext context) => CuratedCategoryCubit()),
                  BlocProvider<CuratedSourceCubit>(create: (BuildContext context) => CuratedSourceCubit()),
                  BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
                ], child: ViewArticlePage(data: args)));
        break;
      default:
        return null;
        break;
    }
  }
}
