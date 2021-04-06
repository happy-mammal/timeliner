import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class JumboCard extends StatefulWidget {
  final List<double> pads;
  final String image;
  const JumboCard({Key key, this.pads, this.image}) : super(key: key);
  @override
  _JumboCardState createState() => _JumboCardState();
}

class _JumboCardState extends State<JumboCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: InkWell(
        onTap: () {
          print('Click');
        },
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.62,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardImage(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.34,
                      url: widget.image,
                      pads: [0, 0, 0, 0],
                      radius: [15, 15, 0, 0],
                    ),
                    ResponsiveText(
                      pads: [10, 0, 10, 0],
                      text: "Puerto Rico enacted strict Covid measures. It paid off, and it's a lesson for the mainland.",
                      lines: 3,
                      min: 22,
                      max: 24,
                      isBold: true,
                      isItalic: false,
                    ),
                    ResponsiveText(
                      pads: [10, 0, 10, 0],
                      text: "Puerto Rico kept Covid-19 cases and deaths down with strict curfews, lockdowns and sanitary measures, moves the island's residents saw as nonpolitical and adopted.",
                      lines: 3,
                      min: 17,
                      max: 19,
                      isBold: false,
                      isItalic: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.settings_input_antenna_rounded,
                                color: Colors.blue,
                                size: 25,
                              ),
                              ResponsiveText(
                                pads: [10, 0, 10, 0],
                                text: "NBC News",
                                lines: 3,
                                min: 16,
                                max: 18,
                                isBold: true,
                                isItalic: false,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                                size: 25,
                              ),
                              ResponsiveText(
                                pads: [10, 0, 10, 0],
                                text: "45 mins ago",
                                lines: 3,
                                min: 16,
                                max: 18,
                                isBold: true,
                                isItalic: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(6),
                        badgeColor: Colors.red,
                        badgeContent: Text(
                          'Science',
                          style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
