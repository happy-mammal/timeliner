import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/blocs/auth/auth_bloc.dart';
import 'package:timeliner/business_logic/cubits/app_theme/app_theme_cubit.dart';
import 'package:timeliner/presentation/widgets/side_bar_button.dart';

class TimeLinerSideBar extends StatefulWidget {
  final PageController controller;
  final ValueChanged<int> onCurrentIndexChanged;

  const TimeLinerSideBar({Key key, this.controller, this.onCurrentIndexChanged}) : super(key: key);
  @override
  _TimeLinerSideBarState createState() => _TimeLinerSideBarState();
}

class _TimeLinerSideBarState extends State<TimeLinerSideBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 90,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              TimeLinerSideBarButton(
                icon: Icons.brightness_4_rounded,
                iconSize: 30,
                iconColor: Colors.grey,
                onButtonPressed: () {
                  BlocProvider.of<AppThemeCubit>(context).setAppTheme();
                },
              ),
              SizedBox(height: 50),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SignInSuccessfull) {
                    return TimeLinerSideBarButton(
                      icon: state.user.photoURL,
                      iconSize: MediaQuery.of(context).size.width,
                      iconColor: Colors.grey,
                      onButtonPressed: () {},
                    );
                  } else if (state is Authenticated) {
                    return TimeLinerSideBarButton(
                      icon: state.user.photoURL,
                      iconSize: MediaQuery.of(context).size.width,
                      iconColor: Colors.grey,
                      onButtonPressed: () {},
                    );
                  } else {
                    return TimeLinerSideBarButton(
                      icon: "https://cdn.iphoneincanada.ca/wp-content/uploads/2020/07/Big-Sur-Wallpaper.jpeg",
                      iconSize: MediaQuery.of(context).size.width,
                      iconColor: Colors.grey,
                      onButtonPressed: () {},
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Divider(thickness: 3, indent: 10, endIndent: 10),
              SizedBox(height: 20),
              TimeLinerSideBarButton(
                icon: Icons.dashboard_rounded,
                iconSize: 30,
                iconColor: Colors.blueAccent,
                onButtonPressed: () {
                  setState(() {
                    widget.onCurrentIndexChanged(0);
                  });
                },
              ),
              SizedBox(height: 30),
              TimeLinerSideBarButton(
                icon: Icons.search_rounded,
                iconSize: 30,
                iconColor: Colors.orangeAccent,
                onButtonPressed: () {
                  setState(() {
                    widget.onCurrentIndexChanged(1);
                  });
                },
              ),
              SizedBox(height: 30),
              TimeLinerSideBarButton(
                icon: Icons.my_library_books_rounded,
                iconSize: 30,
                iconColor: Colors.redAccent,
                onButtonPressed: () {},
              ),
              SizedBox(height: 30),
              TimeLinerSideBarButton(
                icon: Icons.label_rounded,
                iconSize: 30,
                iconColor: Colors.indigoAccent,
                onButtonPressed: () {},
              ),
              SizedBox(height: 20),
              Divider(thickness: 3, indent: 10, endIndent: 10),
              SizedBox(height: 20),
              TimeLinerSideBarButton(
                icon: Icons.add_sharp,
                iconSize: 50,
                iconColor: Colors.orange,
                onButtonPressed: () {},
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
