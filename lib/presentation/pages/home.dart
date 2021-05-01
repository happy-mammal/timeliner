import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/cubits/app_theme/app_theme_cubit.dart';
import 'package:timeliner/business_logic/cubits/curated_category/curated_category_cubit.dart';
import 'package:timeliner/business_logic/cubits/get_stories/get_stories_cubit.dart';
import 'package:timeliner/business_logic/cubits/get_trending/get_trending_cubit.dart';
import 'package:timeliner/business_logic/cubits/search/search_cubit.dart';
import 'package:timeliner/presentation/pages/feed.dart';
import 'package:timeliner/presentation/pages/search.dart';
import 'package:timeliner/presentation/widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  final Map<String, String> data;

  const HomePage({Key key, this.data}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<GetStoriesCubit>(create: (BuildContext context) => GetStoriesCubit()),
                      BlocProvider<GetTrendingCubit>(create: (BuildContext context) => GetTrendingCubit()),
                      BlocProvider<CuratedCategoryCubit>(create: (BuildContext context) => CuratedCategoryCubit()),
                    ],
                    child: FeedPage(data: widget.data),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<SearchCubit>(create: (BuildContext context) => SearchCubit()),
                    ],
                    child: SearchPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
