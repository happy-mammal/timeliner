import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class TimelineCard extends StatefulWidget {
  final List<double> pads;
  final String image;

  const TimelineCard({Key key, this.pads, this.image}) : super(key: key);
  @override
  _TimelineCardState createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.17,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ResponsiveText(
                      pads: [10, 10, 10, 0],
                      text: "Puerto Rico enacted strict Covid measures. It paid off, and it's a lesson for the mainland.",
                      lines: 4,
                      min: 18,
                      max: 20,
                      isBold: true,
                      isItalic: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 7,
                          ),
                          Expanded(
                            child: ResponsiveText(
                              pads: [10, 0, 10, 0],
                              text: "45 mins ago",
                              lines: 2,
                              min: 14,
                              max: 18,
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
              CardImage(
                pads: [5, 5, 5, 5],
                radius: [15, 15, 15, 15],
                width: MediaQuery.of(context).size.width * 0.26,
                height: MediaQuery.of(context).size.height * 0.25,
                url: widget.image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
