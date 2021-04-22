import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class TinyCard extends StatefulWidget {
  final List<double> pads;
  final bool hasBadge, hasSource;
  final String image;

  const TinyCard({Key key, this.hasBadge, this.hasSource, this.pads, this.image}) : super(key: key);
  @override
  _TinyCardState createState() => _TinyCardState();
}

class _TinyCardState extends State<TinyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/viewarticle');
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Stack(
              children: [
                Column(
                  children: [
                    CardImage(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      pads: [0, 0, 0, 0],
                      radius: [15, 15, 0, 0],
                      url: widget.image,
                    ),
                    Expanded(
                      child: ResponsiveText(
                        text: "Puerto Rico kept Covid-19 cases and deaths down with strict curfews, lockdowns and sanitary measures, moves the island's residents saw as nonpolitical and adopted.",
                        max: 17,
                        min: 17,
                        lines: widget.hasSource ? 2 : 4,
                        isBold: false,
                        isItalic: false,
                        pads: [10, 5, 10, 5],
                      ),
                    ),
                    widget.hasSource
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.circle, color: Colors.blue, size: 8),
                                  Expanded(
                                    child: ResponsiveText(
                                      text: "Absforted Meta News",
                                      max: 16,
                                      min: 16,
                                      lines: 2,
                                      isBold: true,
                                      isItalic: false,
                                      pads: [10, 5, 10, 5],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                widget.hasBadge
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Badge(
                              elevation: 0,
                              toAnimate: false,
                              shape: BadgeShape.square,
                              borderRadius: BorderRadius.circular(6),
                              badgeColor: Colors.red,
                              badgeContent: Text(
                                'Science',
                                style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
