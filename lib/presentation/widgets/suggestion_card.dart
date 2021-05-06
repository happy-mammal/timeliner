import 'dart:collection';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/card_image.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class SuggestionCard extends StatelessWidget {
  final LinkedHashMap<String, dynamic> data;
  final VoidCallback onCardTap;
  const SuggestionCard({
    Key key,
    @required this.data,
    this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(data["publishedAt"]);
    var publishedAt = timeago.format(dateTime);

    return InkWell(
      onTap: () {
        onCardTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClayContainer(
          color: Theme.of(context).canvasColor,
          borderRadius: 20,
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  TimeLinerCardImage(
                    radius: [20, 20, 20, 20],
                    pads: [5, 5, 5, 5],
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width,
                    image: data["image"],
                  ),
                  TimeLinerResponsiveText(
                    text: data["title"],
                    min: 20,
                    max: 20,
                    lines: 2,
                    isBold: true,
                    isItalic: false,
                    pads: [10, 10, 10, 10],
                    color: null,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.rss_feed_rounded,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                Expanded(
                                  child: TimeLinerResponsiveText(
                                    pads: [10, 0, 10, 0],
                                    text: data["source"],
                                    lines: 2,
                                    min: 14,
                                    max: 14,
                                    isBold: false,
                                    isItalic: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                Expanded(
                                  child: TimeLinerResponsiveText(
                                    pads: [10, 0, 10, 0],
                                    text: publishedAt,
                                    lines: 2,
                                    min: 14,
                                    max: 14,
                                    isBold: false,
                                    isItalic: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
