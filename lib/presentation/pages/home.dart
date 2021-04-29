import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/cubits/app_theme/app_theme_cubit.dart';
import 'package:timeliner/presentation/pages/feed.dart';
import 'package:timeliner/presentation/pages/search.dart';
import 'package:timeliner/presentation/widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<AppThemeCubit>(context).getAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TimeLinerSideBar(
              onCurrentIndexChanged: (page) {
                _pageController.animateToPage(page, duration: Duration(milliseconds: 1000), curve: Curves.elasticOut);
              },
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                children: [
                  FeedPage(),
                  SearchPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
