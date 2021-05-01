import 'package:badges/badges.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class TimeLinerShimmerCard extends StatefulWidget {
  final double height, width;

  const TimeLinerShimmerCard({Key key, this.height, this.width}) : super(key: key);
  @override
  _TimeLinerShimmerCardState createState() => _TimeLinerShimmerCardState();
}

class _TimeLinerShimmerCardState extends State<TimeLinerShimmerCard> {
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.width / 2.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 8, bottom: 1, left: 8),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height * 0.02,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 8, bottom: 1, left: 8),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height * 0.02,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 8, bottom: 1, left: 8),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height * 0.02,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 8, bottom: 5, left: 8),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height * 0.03,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Shimmer.fromColors(
                    highlightColor: Theme.of(context).backgroundColor,
                    baseColor: Theme.of(context).canvasColor,
                    period: Duration(milliseconds: 500),
                    child: Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      borderRadius: BorderRadius.circular(10),
                      badgeColor: Theme.of(context).canvasColor,
                      badgeContent: TimeLinerResponsiveText(
                        text: 'Entertainment',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
