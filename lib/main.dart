import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/blocs/auth/auth_bloc.dart';
import 'package:timeliner/business_logic/cubits/app_theme/app_theme_cubit.dart';
import 'package:timeliner/presentation/routes/app_route.dart';
import 'package:timeliner/presentation/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TimeLiner());
}

class TimeLiner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeCubit>(create: (BuildContext context) => AppThemeCubit()),
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()..add(AppStartedEvent())),
      ],
      child: TimeLinerMaterialApp(),
    );
  }
}

class TimeLinerMaterialApp extends StatefulWidget {
  @override
  _TimeLinerMaterialAppState createState() => _TimeLinerMaterialAppState();
}

class _TimeLinerMaterialAppState extends State<TimeLinerMaterialApp> {
  AppRoute appRoute = AppRoute();
  AppTheme appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme(),
      darkTheme: appTheme.darkTheme(),
      themeMode: context.select((AppThemeCubit appThemeCubit) => appThemeCubit.state.themeMode),
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
