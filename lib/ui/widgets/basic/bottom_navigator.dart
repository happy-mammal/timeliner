import 'package:flutter/material.dart';
import 'package:timeliner/ui/screens/search.dart';
import 'package:timeliner/ui/screens/home.dart';
import 'package:timeliner/ui/screens/library.dart';
import 'package:timeliner/ui/screens/taged.dart';
import 'package:timeliner/ui/widgets/compos/bottom_navigaton_bar.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [HomeScreen(), SearchScreen(), LibraryScreen(), TagedScreen()],
          onPageChanged: (page) {
            setState(() {
              currentIndex = page;
            });
          },
        ),
        bottomNavigationBar: BottomNavigatonBar(
          getCurrentIndex: currentIndex,
          onCurrentIndexChanged: (value) {
            _pageController.jumpToPage(value);
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
