import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/logic/auth_bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                print('I DONT KNOW');
              } else if (state is AuthLoading) {
                print('PLEASE WAIT I AM CHECKING');
              } else if (state is Authenticated) {
                Navigator.of(context).popAndPushNamed('/home');
                print('WELCOME YOU HAVE ACCESS');
              } else if (state is UnAuthenticated) {
                Navigator.of(context).popAndPushNamed('/auth');
                print('SORRY YOU DONT HAVE ACCESS');
              }
            },
            child: Text('SPLASH SCREEN'),
          ),
        ),
      ),
    );
  }
}
