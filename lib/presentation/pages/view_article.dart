import 'dart:collection';
import 'package:badges/badges.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/business_logic/cubits/curated_category/curated_category_cubit.dart';
import 'package:timeliner/business_logic/cubits/curated_source/curated_source_cubit.dart';
import 'package:timeliner/presentation/widgets/card_image.dart';
import 'package:timeliner/presentation/widgets/chip_button.dart';
import 'package:timeliner/presentation/widgets/intrest_chip.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeliner/presentation/widgets/suggestion_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewArticlePage extends StatefulWidget {
  final LinkedHashMap<String, dynamic> data;

  const ViewArticlePage({Key key, this.data}) : super(key: key);
  @override
  _ViewArticlePageState createState() => _ViewArticlePageState();
}

class _ViewArticlePageState extends State<ViewArticlePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.data["uid"]);

    DateTime dateTime = DateTime.parse(widget.data["article"]["publishedAt"]);
    var publishedAt = timeago.format(dateTime);
    BlocProvider.of<CuratedCategoryCubit>(context).getCuratedCategoryFeed(widget.data["article"]["category"], 5);
    BlocProvider.of<CuratedSourceCubit>(context).getCuratedSourceFeed(widget.data["article"]["source"], 5);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChipButton(
                    width: 0.30,
                    text: "BACK",
                    icon: Icons.navigate_before_rounded,
                    onChipTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ChipButton(
                    width: 0.28,
                    text: "Save",
                    icon: Icons.bookmark_rounded,
                    onChipTap: () {
                      BlocProvider.of<UserBloc>(context).add(AddSavesEvent(articleIds: ['"' + widget.data["article"]["id"] + '"'], uid: widget.data["uid"]));
                      Fluttertoast.showToast(msg: "Adding to Saves List", toastLength: Toast.LENGTH_LONG);
                    },
                  ),
                ],
              ),
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is AddSavesSuccessfull) {
                    Fluttertoast.showToast(msg: "Article Saved", toastLength: Toast.LENGTH_SHORT);
                  } else if (state is AddIntrestsSuccessfull) {
                    Fluttertoast.showToast(msg: "Intrest Added", toastLength: Toast.LENGTH_SHORT);
                  }
                },
                child: Container(),
              ),
              TimeLinerResponsiveText(
                text: widget.data["article"]["title"],
                min: 35,
                max: 35,
                lines: 5,
                isBold: true,
                isItalic: false,
                pads: [20, 20, 20, 20],
                color: null,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeLinerResponsiveText(
                      text: publishedAt.toString(),
                      min: 16,
                      max: 16,
                      lines: 1,
                      isBold: false,
                      isItalic: false,
                      pads: [0, 0, 0, 0],
                      color: Colors.grey,
                    ),
                    Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      borderRadius: BorderRadius.circular(10),
                      badgeColor: Colors.green,
                      badgeContent: TimeLinerResponsiveText(
                        text: widget.data["article"]["category"],
                        max: 16,
                        min: 16,
                        lines: 1,
                        isBold: true,
                        isItalic: false,
                        color: Colors.white,
                        pads: [2, 2, 2, 2],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: ClayContainer(
                  borderRadius: 20,
                  color: Theme.of(context).canvasColor,
                  child: TimeLinerCardImage(
                    height: MediaQuery.of(context).size.width / 2,
                    radius: [20, 20, 20, 20],
                    pads: [0, 0, 0, 0],
                    image: widget.data["article"]["image"],
                  ),
                ),
              ),
              TimeLinerResponsiveText(
                text: widget.data["article"]["description"],
                min: 18,
                max: 18,
                lines: 10,
                isBold: false,
                isItalic: false,
                pads: [20, 0, 20, 20],
                color: Colors.grey,
              ),
              TimeLinerResponsiveText(
                text: widget.data["article"]["content"].toString().substring(0, widget.data["article"]["content"].toString().indexOf('[')),
                min: 18,
                max: 18,
                lines: 10,
                isBold: false,
                isItalic: false,
                pads: [20, 0, 20, 20],
                color: Colors.grey,
              ),
              ChipButton(
                width: 0.42,
                text: "Read More",
                icon: Icons.read_more_rounded,
                onChipTap: () async {
                  await canLaunch(widget.data["article"]["url"].toString()) ? await launch(widget.data["article"]["url"].toString()) : throw 'Could not launch link';
                },
              ),
              ChipButton(
                width: 0.85,
                text: "Source: " + widget.data["article"]["source"],
                icon: Icons.rss_feed_rounded,
                onChipTap: () async {
                  await canLaunch(widget.data["article"]["source_url"].toString()) ? await launch(widget.data["article"]["source_url"].toString()) : throw 'Could not launch link';
                },
              ),
              TimeLinerResponsiveText(
                text: "Intrests",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [30, 20, 20, 20],
                color: null,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 5.2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.data["article"]["keywords"].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: TimeLinerIntrestChip(
                          height: 0,
                          prefixIcon: Icons.add_sharp,
                          text: widget.data["article"]["keywords"][index],
                          isLoading: false,
                          onPrefixPressed: () {
                            BlocProvider.of<UserBloc>(context).add(
                              AddIntrestsEvent(
                                intrests: ['"' + widget.data["article"]["keywords"][index] + '"'],
                                uid: widget.data["uid"],
                              ),
                            );

                            Fluttertoast.showToast(msg: "Adding to Intrest Library", toastLength: Toast.LENGTH_SHORT);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              TimeLinerResponsiveText(
                text: "More From Category",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [30, 20, 20, 20],
                color: null,
              ),
              BlocBuilder<CuratedCategoryCubit, CuratedCategoryState>(
                builder: (context, state) {
                  if (state is CuratedCategorySuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.data.length,
                          itemBuilder: (context, i) {
                            return SuggestionCard(
                              data: state.data[i],
                              onCardTap: () {
                                Navigator.of(context).pushNamed(
                                  '/viewarticle',
                                  arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              TimeLinerResponsiveText(
                text: "More From Source",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [30, 20, 20, 20],
                color: null,
              ),
              BlocBuilder<CuratedSourceCubit, CuratedSourceState>(
                builder: (context, state) {
                  if (state is CuratedSourceSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.data.length,
                          itemBuilder: (context, i) {
                            return SuggestionCard(
                              data: state.data[i],
                              onCardTap: () {
                                Navigator.of(context).pushNamed(
                                  '/viewarticle',
                                  arguments: {"article": state.data[i], "uid": widget.data["uid"]},
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
