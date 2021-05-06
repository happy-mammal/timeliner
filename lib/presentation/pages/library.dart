import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/business_logic/cubits/get_intrests/get_intrests_cubit.dart';
import 'package:timeliner/presentation/widgets/feed_card.dart';
import 'package:timeliner/presentation/widgets/intrest_chip.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeliner/presentation/widgets/shimmer_card.dart';

class LibraryPage extends StatefulWidget {
  final Map<String, String> data;

  const LibraryPage({Key key, this.data}) : super(key: key);
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent(uid: widget.data["uid"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeLinerResponsiveText(
            text: "Your Intrest List",
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
                List<String> intrests = [];
                List<String> sample = ["Sports", "Technology", "Science", "Health", "World", "Nation"];
                List<String> processedIntrests = [];

                for (var i = 0; i < state.intrests["intrests"].length; i++) {
                  intrests.add(state.intrests["intrests"][i]);
                }
                for (var i = 0; i < sample.length; i++) {
                  if (intrests.contains(sample[i])) {
                    intrests.remove(sample[i]);
                  }
                }
                for (var i = 0; i < intrests.length; i++) {
                  processedIntrests.add('"' + intrests[i] + '"');
                }
                BlocProvider.of<GetIntrestsCubit>(context).getArticlesFromIntrests(processedIntrests);
              } else if (state is RemoveIntrestsSuccessfull) {
                BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent(uid: widget.data["uid"]));
                Fluttertoast.showToast(msg: "Intrest Removed", toastLength: Toast.LENGTH_SHORT);
              }
            },
            child: Container(),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is GetUserDetailsSuccessfull) {
                List<String> intrests = [];
                List<String> sample = ["Sports", "Technology", "Science", "Health", "World", "Nation"];
                List<String> stores = [];
                for (var i = 0; i < state.intrests["intrests"].length; i++) {
                  intrests.add(state.intrests["intrests"][i]);
                }

                for (var i = 0; i < sample.length; i++) {
                  if (intrests.contains(sample[i])) {
                    intrests.remove(sample[i]);
                  }
                }

                for (var i = 0; i < state.intrests["istores"].length; i++) {
                  stores.add('"' + state.intrests["istores"][i] + '"');
                }

                return intrests.isEmpty
                    ? Container()
                    : SizedBox(
                        height: MediaQuery.of(context).size.width / 4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: intrests.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: TimeLinerIntrestChip(
                                height: height,
                                text: intrests[index],
                                prefixIcon: Icons.article_rounded,
                                suffixIcon: Icons.clear_rounded,
                                isLoading: false,
                                onPrefixPressed: () {
                                  BlocProvider.of<GetIntrestsCubit>(context).getArticlesFromIntrests(['"' + intrests[index] + '"']);
                                },
                                onSuffixPressed: () {
                                  BlocProvider.of<UserBloc>(context).add(RemoveIntrestsEvent(userId: widget.data["uid"], intrests: ['"' + intrests[index] + '"'], stores: stores));
                                  Fluttertoast.showToast(msg: "Removing From Library", toastLength: Toast.LENGTH_LONG);
                                },
                              ),
                            );
                          },
                        ),
                      );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Center(
                        child: TimeLinerIntrestChip(
                          prefixIcon: Icons.article_rounded,
                          height: height,
                          text: "sample Text",
                          isLoading: true,
                          onPrefixPressed: () {},
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          BlocBuilder<GetIntrestsCubit, GetIntrestsState>(
            builder: (context, state) {
              if (state is GetIntrestsSuccess) {
                List<Widget> results = [];
                for (var i = 0; i < state.data.length; i++) {
                  results.add(
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
                results.shuffle();
                return Column(children: results);
              } else if (state is GetIntrestsLoading) {
                List<Widget> list = [];

                for (var i = 0; i < 10; i++) {
                  list.add(TimeLinerShimmerCard(height: height, width: width));
                }
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
              } else if (state is GetIntrestsInitial) {
                List<Widget> list = [];

                for (var i = 0; i < 10; i++) {
                  list.add(TimeLinerShimmerCard(height: height, width: width));
                }
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
              } else if (state is GetIntrestsEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClayContainer(
                    color: Theme.of(context).canvasColor,
                    borderRadius: 20,
                    child: TimeLinerResponsiveText(
                      text: "No Intrests Found.\nTap on Intrest chips to add intrests in your library while reading articles.",
                      min: 25,
                      max: 25,
                      lines: 10,
                      isBold: false,
                      isItalic: false,
                      pads: [18, 10, 18, 10],
                      color: null,
                    ),
                  ),
                );
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
      ),
    );
  }
}
