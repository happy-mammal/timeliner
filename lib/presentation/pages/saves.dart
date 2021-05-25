import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/business_logic/cubits/get_saved_articles/get_saved_articles_cubit.dart';
import 'package:timeliner/presentation/widgets/feed_card.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeliner/presentation/widgets/shimmer_card.dart';

class SavesPage extends StatefulWidget {
  final String userId;

  const SavesPage({Key key, this.userId}) : super(key: key);
  @override
  _SavesPageState createState() => _SavesPageState();
}

class _SavesPageState extends State<SavesPage> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent(uid: widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> stores = [];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        TimeLinerResponsiveText(
          text: "Saved Articles",
          min: 30,
          max: 30,
          lines: 1,
          isBold: true,
          isItalic: false,
          pads: [18, 10, 18, 10],
          color: null,
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is GetUserDetailsSuccessfull) {
              List<String> saves = [];

              for (var i = 0; i < state.intrests["saves"].length; i++) {
                saves.add('"' + state.intrests["saves"][i] + '"');
              }

              for (var i = 0; i < state.intrests["sstores"].length; i++) {
                stores.add('"' + state.intrests["sstores"][i] + '"');
              }

              BlocProvider.of<GetSavedArticlesCubit>(context).getSavedArticles(saves);
            } else if (state is RemoveSavesSuccessfull) {
              BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent(uid: widget.userId));
              Fluttertoast.showToast(msg: "Saved Article Removed", toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Container(),
        ),
        BlocBuilder<GetSavedArticlesCubit, GetSavedArticlesState>(
          builder: (context, state) {
            if (state is GetSavedArticlesSuccess) {
              List<Widget> results = [];
              for (var i = 0; i < state.articles.length; i++) {
                results.add(
                  TimeLinerFeedCard(
                    height: height,
                    width: width,
                    url: state.articles[i]["image"],
                    title: state.articles[i]["title"],
                    category: state.articles[i]["category"],
                    date: state.articles[i]["publishedAt"],
                    source: state.articles[i]["source"],
                    onCardTap: () {
                      Navigator.of(context).pushNamed(
                        '/viewarticle',
                        arguments: {"article": state.articles[i], "uid": widget.userId},
                      );
                    },
                    onCardDoubleTap: () {
                      BlocProvider.of<UserBloc>(context).add(RemoveSavesEvent(userId: widget.userId, articleIds: ['"' + state.articles[i]["id"] + '"'], stores: stores));
                      Fluttertoast.showToast(msg: "Removing From Saves", toastLength: Toast.LENGTH_LONG);
                    },
                  ),
                );
              }

              results.shuffle();

              if (results.isNotEmpty) {
                return Column(children: results);
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ClayContainer(
                        color: Theme.of(context).canvasColor,
                        borderRadius: 20,
                        child: TimeLinerResponsiveText(
                          text: "No Saved Articles Found.\n\nTap on Save to add article in your Saved Articles while reading articles.",
                          min: 25,
                          max: 25,
                          lines: 10,
                          isBold: false,
                          isItalic: false,
                          pads: [20, 20, 20, 20],
                          color: null,
                        ),
                      ),
                    ),
                  ],
                );
              }
            } else {
              List<Widget> list = [];

              for (var i = 0; i < 10; i++) {
                list.add(TimeLinerShimmerCard(height: height, width: width));
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
            }
          },
        ),
      ],
    );
  }
}
