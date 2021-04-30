import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sign_button/sign_button.dart';
import 'package:timeliner/business_logic/blocs/auth/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pushReplacementNamed('/home', arguments: {"uid": state.user.uid});
            } else if (state is UnAuthenticated) {
            } else if (state is SignInSuccessfull) {
              if (state.isExists) {
                Navigator.of(context).pushReplacementNamed('/home', arguments: {"uid": state.user.uid});
              } else {
                Navigator.of(context).pushReplacementNamed(
                  '/setup',
                  arguments: {
                    "uid": state.user.uid,
                    "email": state.user.email,
                    "name": state.user.displayName,
                    "photoURL": state.user.photoURL,
                  },
                );
              }
            }
          },
          builder: (context, state) {
            if (state is Authenticated) {
              return Container();
            } else if (state is UnAuthenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Shimmer.fromColors(
                          highlightColor: Color(0xFF00d2ff),
                          baseColor: Color(0xFF3a7bd5),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SignInButton(
                      padding: 10,
                      elevation: 10,
                      width: MediaQuery.of(context).size.width * 0.65,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 2, color: Colors.blue),
                      ),
                      buttonSize: ButtonSize.large,
                      buttonType: ButtonType.google,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(SignInEvent());
                      },
                    ),
                  ),
                ],
              );
            } else if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
