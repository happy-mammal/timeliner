import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/business_logic/cubits/curated_category/curated_category_cubit.dart';
import 'package:timeliner/business_logic/cubits/get_stories/get_stories_cubit.dart';
import 'package:timeliner/business_logic/cubits/get_trending/get_trending_cubit.dart';
import 'package:timeliner/presentation/widgets/feed_card.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeliner/presentation/widgets/shimmer_card.dart';

class FeedPage extends StatefulWidget {
  final Map<String, String> data;

  const FeedPage({Key key, this.data}) : super(key: key);
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  _processCategory(List<String> intrests) {
    List<String> sample = ["Sports", "Technology", "Science", "Health", "World", "Nation"];
    List<String> cats = [];
    for (var i = 0; i < sample.length; i++) {
      if (intrests.contains(sample[i])) {
        cats.add(sample[i]);
      }
    }
    try {
      return (cats.toList()..shuffle()).first;
    } catch (e) {
      return [];
    }
  }

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent(uid: widget.data["uid"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is GetUserDetailsSuccessfull) {
              List<String> intrests = [];
              List<String> processedIntrests = [];
              for (var i = 0; i < state.intrests["intrests"].length; i++) {
                intrests.add(state.intrests["intrests"][i]);
                processedIntrests.add('"' + state.intrests["intrests"][i] + '"');
              }
              var randomCategory = _processCategory(intrests);
              print(randomCategory);
              BlocProvider.of<GetStoriesCubit>(context).getStories();
              BlocProvider.of<GetTrendingCubit>(context).getTrending();
              BlocProvider.of<CuratedCategoryCubit>(context).getCuratedCategoryFeed(randomCategory, 3);
            }
          },
          child: Container(),
        ),
        BlocBuilder<GetStoriesCubit, GetStoriesState>(
          builder: (context, state) {
            if (state is GetStoriesLoading || state is GetStoriesInitial) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Breaking News",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 5; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetStoriesSuccess) {
              List<Widget> list = [];

              for (var i = 0; i < (state.data.length ~/ 2); i++) {
                list.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.data[i]["image"],
                    title: state.data[i]["title"],
                    category: state.data[i]["category"],
                    date: state.data[i]["publishedAt"],
                    source: state.data[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                      );
                    },
                  ),
                );
              }
              list.shuffle();
              list.insert(
                  0,
                  TimeLinerResponsiveText(
                    text: "Breaking News",
                    min: 30,
                    max: 30,
                    lines: 1,
                    isBold: true,
                    isItalic: false,
                    pads: [18, 10, 18, 10],
                    color: null,
                  ));

              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetStoriesFailed) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Breaking News",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 5; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else {
              return Container();
            }
          },
        ),
        BlocBuilder<CuratedCategoryCubit, CuratedCategoryState>(
          builder: (context, state) {
            if (state is CuratedCategoryLoading) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Curated For You",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is CuratedCategorySuccess) {
              List<Widget> list = [];

              for (var i = 0; i < state.data.length; i++) {
                list.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.data[i]["image"],
                    title: state.data[i]["title"],
                    category: state.data[i]["category"],
                    date: state.data[i]["publishedAt"],
                    source: state.data[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                      );
                    },
                  ),
                );
              }
              list.shuffle();
              list.insert(
                  0,
                  TimeLinerResponsiveText(
                    text: "Curated For You",
                    min: 30,
                    max: 30,
                    lines: 1,
                    isBold: true,
                    isItalic: false,
                    pads: [18, 10, 18, 10],
                    color: null,
                  ));
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is CuratedCategoryFailed) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Curated For You",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else {
              return Container();
            }
          },
        ),
        BlocBuilder<GetTrendingCubit, GetTrendingState>(
          builder: (context, state) {
            if (state is GetTrendingLoading) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Trending Hot",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetTrendingSuccess) {
              List<Widget> list = [];

              for (var i = 0; i < (state.data.length ~/ 2); i++) {
                list.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.data[i]["image"],
                    title: state.data[i]["title"],
                    category: state.data[i]["category"],
                    date: state.data[i]["publishedAt"],
                    source: state.data[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                      );
                    },
                  ),
                );
              }
              list.shuffle();
              list.insert(
                  0,
                  TimeLinerResponsiveText(
                    text: "Trending Hot",
                    min: 30,
                    max: 30,
                    lines: 1,
                    isBold: true,
                    isItalic: false,
                    pads: [18, 10, 18, 10],
                    color: null,
                  ));
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetTrendingFailed) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Trending Hot",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else {
              return Container();
            }
          },
        ),
        BlocBuilder<GetStoriesCubit, GetStoriesState>(
          builder: (context, state) {
            if (state is GetStoriesLoading || state is GetStoriesInitial) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Stories",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 5; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetStoriesSuccess) {
              List<Widget> list = [];

              for (var i = (state.data.length ~/ 2); i < state.data.length; i++) {
                list.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.data[i]["image"],
                    title: state.data[i]["title"],
                    category: "Stories",
                    date: state.data[i]["publishedAt"],
                    source: state.data[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                      );
                    },
                  ),
                );
              }
              list.shuffle();
              list.insert(
                  0,
                  TimeLinerResponsiveText(
                    text: "Stories",
                    min: 30,
                    max: 30,
                    lines: 1,
                    isBold: true,
                    isItalic: false,
                    pads: [18, 10, 18, 10],
                    color: null,
                  ));

              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetStoriesFailed) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Stories",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 5; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else {
              return Container();
            }
          },
        ),
        BlocBuilder<GetTrendingCubit, GetTrendingState>(
          builder: (context, state) {
            if (state is GetTrendingLoading) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Latest News",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetTrendingSuccess) {
              List<Widget> list = [];

              for (var i = (state.data.length ~/ 2); i < state.data.length; i++) {
                list.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.data[i]["image"],
                    title: state.data[i]["title"],
                    category: state.data[i]["category"],
                    date: state.data[i]["publishedAt"],
                    source: state.data[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                      );
                    },
                  ),
                );
              }
              list.shuffle();
              list.insert(
                  0,
                  TimeLinerResponsiveText(
                    text: "Latest News",
                    min: 30,
                    max: 30,
                    lines: 1,
                    isBold: true,
                    isItalic: false,
                    pads: [18, 10, 18, 10],
                    color: null,
                  ));
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else if (state is GetTrendingFailed) {
              List<Widget> list = [];
              list.add(TimeLinerResponsiveText(
                text: "Latest News",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [18, 10, 18, 10],
                color: null,
              ));
              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
