import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/card_image.dart';

class TimeLinerFeedCard extends StatefulWidget {
  final double height, width;
  final String url;

  const TimeLinerFeedCard({Key key, this.height, this.width, this.url}) : super(key: key);
  @override
  _TimeLinerFeedCardState createState() => _TimeLinerFeedCardState();
}

class _TimeLinerFeedCardState extends State<TimeLinerFeedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ClayContainer(
        borderRadius: 20,
        color: Theme.of(context).canvasColor,
        height: widget.height * 0.40,
        child: Column(
          children: [
            TimeLinerCardImage(
              pads: [5, 5, 5, 5],
              radius: [20, 20, 20, 20],
              width: widget.width,
              height: widget.width / 2,
              image: widget.url,
            ),
          ],
        ),
      ),
    );
  }
}
