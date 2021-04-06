import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeliner/logic/app_theme_bloc/app_theme_bloc.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/utils/app_strings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppThemeBloc appThemeBloc;
  bool isNotify = false;
  bool isDark = false;

  @override
  void initState() {
    _getDarkState();
    super.initState();
  }

  _getDarkState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool('isDark') != null ? prefs.getBool('isDark') : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    appThemeBloc = BlocProvider.of<AppThemeBloc>(context);

    Future<bool> _onBackPressed() {
      Navigator.of(context).popAndPushNamed('/');
      return Future.value(false);
    }

    AppStrings ast = AppStrings();

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<AppThemeBloc, AppThemeState>(
            listener: (context, state) {
              if (state is AppThemeInitial) {
                setState(() {
                  isDark = false;
                });
              } else if (state is AppThemeLoading) {
                setState(() {
                  isDark = false;
                });
              } else if (state is AppThemeFailed) {
                setState(() {
                  isDark = false;
                });
              } else if (state is AppThemeSuccess) {
                if (state.themeMode == ThemeMode.dark) {
                  setState(() {
                    isDark = true;
                  });
                } else {
                  setState(() {
                    isDark = false;
                  });
                }
              } else {
                setState(() {
                  isDark = isDark;
                });
              }
            },
            child: ListView(
              children: [
                TopAppBar(pads: [20, 10, 20, 10], title: ast.intrestNames[0], profile: ast.profileUrl),
                myProfile(),
                personalPreferences(),
                appPreferences(appThemeBloc),
                otherSettings(),
                logoutSetting(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://e3.365dm.com/21/02/2048x1152/skynews-elon-musk_5257586.jpg'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*CardTextWithOverflow(
                      text: "Yash Lalit",
                      color: Colors.grey[900],
                      maxlines: 1,
                      maxsize: 22,
                      minsize: 18,
                      padLeft: 20,
                      padRight: 10,
                      isItalic: false,
                      isBold: true,
                    ),*/
                    ResponsiveText(
                      text: "Yash Lalit",
                      lines: 1,
                      max: 22,
                      min: 18,
                      isItalic: false,
                      isBold: true,
                      pads: [20, 0, 10, 0],
                    ),
                    /*CardTextWithOverflow(
                      text: "yashlalit.23@gmail.com",
                      color: Colors.grey[800],
                      maxlines: 1,
                      maxsize: 18,
                      minsize: 16,
                      padLeft: 20,
                      padRight: 10,
                      isItalic: false,
                      isBold: false,
                    ),*/
                    ResponsiveText(
                      text: "yashlalit.23@gmail.com",
                      lines: 1,
                      max: 18,
                      min: 16,
                      isItalic: false,
                      isBold: false,
                      pads: [20, 0, 10, 0],
                    ),
                  ],
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personalPreferences() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bookmarks_rounded, color: Color(0xff3A86FF), size: 30),
                  /*CardTextWithOverflow(
                    text: "Saved Articles",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Saved Articles",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey, indent: 50, endIndent: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.book_rounded, color: Color(0xffFFBE0B), size: 30),
                  /*CardTextWithOverflow(
                    text: "Intrest Dictionary",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Intrest Dictonary",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appPreferences(AppThemeBloc appThemeBloc) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.brightness_6_rounded, color: Colors.grey[850], size: 30),
                  /*CardTextWithOverflow(
                    text: "Dark Mode",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Dark Mode",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Switch(
                    onChanged: (bool value) {
                      appThemeBloc.add(SetAppThemeEvent());
                    },
                    value: isDark,
                    activeColor: Color(0xff3A86FF),
                    inactiveThumbColor: Colors.grey[900],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey, indent: 50, endIndent: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notifications_on_rounded, color: Colors.green, size: 30),
                  /*CardTextWithOverflow(
                    text: "Notifications",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Notifications",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Switch(
                    onChanged: toggleSwitchNotify,
                    value: isNotify,
                    activeColor: Color(0xff3A86FF),
                    inactiveThumbColor: Colors.green,
                    inactiveTrackColor: Colors.green[200],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otherSettings() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_rounded, color: Color(0xffFF006E), size: 30),
                  /*CardTextWithOverflow(
                    text: "Tell a Friend",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Tell a Friend",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey, indent: 50, endIndent: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.info_rounded, color: Color(0xffFB5607), size: 30),
                  /*CardTextWithOverflow(
                    text: "About this App",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "About this App",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey, indent: 50, endIndent: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.attach_money_rounded, color: Color(0xff8338EC), size: 30),
                  /*CardTextWithOverflow(
                    text: "Donate and Help",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Donate and Contribute",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutSetting() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.logout, color: Colors.indigo[900], size: 30),
                  /*CardTextWithOverflow(
                    text: "Log Out",
                    maxlines: 1,
                    minsize: 20,
                    maxsize: 20,
                    color: Colors.grey[900],
                    isBold: false,
                    isItalic: false,
                    padLeft: 20,
                    padRight: 10,
                  ),*/
                  ResponsiveText(
                    text: "Log Out",
                    lines: 1,
                    max: 20,
                    min: 20,
                    isItalic: false,
                    isBold: false,
                    pads: [20, 0, 10, 0],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleSwitchNotify(bool value) {
    if (isNotify == false) {
      setState(() {
        isNotify = true;
      });
    } else {
      setState(() {
        isNotify = false;
      });
    }
  }
}
