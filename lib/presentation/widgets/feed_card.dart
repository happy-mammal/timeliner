import 'package:badges/badges.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/card_image.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeLinerFeedCard extends StatefulWidget {
  final double height, width;
  final String url, title, category, date, source;

  const TimeLinerFeedCard({Key key, this.height, this.width, this.url, this.title, this.category, this.date, this.source}) : super(key: key);
  @override
  _TimeLinerFeedCardState createState() => _TimeLinerFeedCardState();
}

class _TimeLinerFeedCardState extends State<TimeLinerFeedCard> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.date);
    var publishedAt = timeago.format(dateTime);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ClayContainer(
        borderRadius: 20,
        color: Theme.of(context).canvasColor,
        height: widget.height * 0.40,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TimeLinerCardImage(
                  pads: [5, 5, 5, 5],
                  radius: [14, 14, 14, 14],
                  width: widget.width,
                  height: widget.width / 2.2,
                  image: widget.url,
                ),
                TimeLinerResponsiveText(
                  text: widget.title,
                  max: 20,
                  min: 20,
                  lines: 2,
                  isBold: true,
                  isItalic: false,
                  pads: [8, 5, 8, 5],
                  color: null,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.rss_feed_rounded,
                              color: Colors.blue,
                              size: 25,
                            ),
                            Expanded(
                              child: TimeLinerResponsiveText(
                                pads: [10, 0, 10, 0],
                                text: widget.source,
                                lines: 2,
                                min: 16,
                                max: 16,
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
                              size: 25,
                            ),
                            Expanded(
                              child: TimeLinerResponsiveText(
                                pads: [10, 0, 10, 0],
                                text: publishedAt,
                                lines: 2,
                                min: 16,
                                max: 16,
                                isBold: false,
                                isItalic: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    borderRadius: BorderRadius.circular(10),
                    badgeColor: Theme.of(context).canvasColor,
                    badgeContent: TimeLinerResponsiveText(
                      text: widget.category,
                      max: 16,
                      min: 16,
                      lines: 1,
                      isBold: true,
                      isItalic: false,
                      color: null,
                      pads: [2, 2, 2, 2],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
