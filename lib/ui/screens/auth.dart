import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';
import 'package:timeliner/logic/auth_bloc/auth_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "TimeLiner",
                      style: GoogleFonts.kaushanScript(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Feeds . News . Intrests . Timelines",
              style: GoogleFonts.kaushanScript(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SignInButton(
                padding: 10,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 2, color: Colors.blue),
                ),
                buttonSize: ButtonSize.large,
                buttonType: ButtonType.google,
                onPressed: () {
                  authBloc.add(SignInEvent());
                },
              ),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                } else if (state is AuthLoading) {
                } else if (state is SignInSuccessfull) {
                  Navigator.of(context).popAndPushNamed('/home');
                } else if (state is SignInFailed) {
                  print(state.message);
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
