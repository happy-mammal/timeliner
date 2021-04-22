import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/logic/cubit/curated_category_feed_cubit.dart';
import 'package:timeliner/logic/cubit/curated_source_feed_cubit.dart';
import 'package:timeliner/logic/cubit/get_stories_cubit.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/cards/capsule_card.dart';
import 'package:timeliner/ui/widgets/cards/jumbo_card.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/ui/widgets/compos/top_news.dart';
import 'package:timeliner/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppStrings ast = AppStrings();
    GetStoriesCubit getStoriesCubit = BlocProvider.of<GetStoriesCubit>(context);
    CuratedSourceFeedCubit curatedSourceFeedCubit = BlocProvider.of<CuratedSourceFeedCubit>(context);
    CuratedCategoryFeedCubit curatedCategoryFeedCubit = BlocProvider.of<CuratedCategoryFeedCubit>(context);
    getStoriesCubit.getStories();
    curatedSourceFeedCubit.getCuratedSourceFeed();
    curatedCategoryFeedCubit.getCuratedCategoryFeed();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAppBar(pads: [20, 10, 20, 10], title: ast.homeNames[0], profile: ast.profileUrl),
            BlocBuilder<GetStoriesCubit, GetStoriesState>(
              builder: (context, state) {
                if (state is GetStoriesInitial) {
                  return TopNewsList(pads: [0, 0, 0, 0], data: []);
                } else if (state is GetStoriesLoading) {
                  return TopNewsList(pads: [0, 0, 0, 0], data: []);
                } else if (state is GetStoriesSuccess) {
                  return TopNewsList(pads: [0, 0, 0, 0], data: state.data);
                } else if (state is GetStoriesFailed) {
                  return TopNewsList(pads: [0, 0, 0, 0], data: []);
                } else {
                  return TopNewsList(pads: [0, 0, 0, 0], data: []);
                }
              },
            ),
            ResponsiveText(text: ast.homeNames[2], min: 28, max: 30, lines: 1, pads: [20, 5, 20, 5], isBold: true, isItalic: false),
            BlocBuilder<CuratedSourceFeedCubit, CuratedSourceFeedState>(
              builder: (context, state) {
                if (state is CuratedSourceFeedSuccess) {
                  return CapsuleCard(
                    pads: [20, 10, 20, 10],
                    heading: "FROM SOURCE YOU FOLLOW",
                    title: "The Guardian",
                    data: state.data,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            BlocBuilder<CuratedCategoryFeedCubit, CuratedCategoryFeedState>(
              builder: (context, state) {
                if (state is CuratedCategoryFeedSuccess) {
                  return CapsuleCard(
                    pads: [20, 10, 20, 10],
                    heading: "FROM CATEGORY YOU LIKE",
                    title: "Technology",
                    data: state.data,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            ResponsiveText(text: ast.homeNames[1], min: 28, max: 30, lines: 1, pads: [20, 5, 20, 5], isBold: true, isItalic: false),
            JumboCard(pads: [20, 10, 20, 10], image: ast.imageUrls[0]),
            JumboCard(pads: [20, 10, 20, 10], image: ast.imageUrls[0]),
            JumboCard(pads: [20, 10, 20, 10], image: ast.imageUrls[0]),
            JumboCard(pads: [20, 10, 20, 10], image: ast.imageUrls[0]),
          ],
        ),
      ),
    );
  }
}
