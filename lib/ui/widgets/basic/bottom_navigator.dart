import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/logic/cubit/curated_category_feed_cubit.dart';
import 'package:timeliner/logic/cubit/curated_source_feed_cubit.dart';
import 'package:timeliner/logic/cubit/get_stories_cubit.dart';
import 'package:timeliner/ui/screens/search.dart';
import 'package:timeliner/ui/screens/home.dart';
import 'package:timeliner/ui/screens/intrests.dart';
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
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider<GetStoriesCubit>(create: (BuildContext context) => GetStoriesCubit()),
                BlocProvider<CuratedSourceFeedCubit>(create: (BuildContext context) => CuratedSourceFeedCubit()),
                BlocProvider<CuratedCategoryFeedCubit>(create: (BuildContext context) => CuratedCategoryFeedCubit()),
              ],
              child: HomeScreen(),
            ),
            SearchScreen(),
            IntrestsScreen(),
            TagedScreen(),
          ],
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
