import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class SearchCard extends StatefulWidget {
  final List<double> pads;
  final String image;

  const SearchCard({Key key, this.pads, this.image}) : super(key: key);
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: InkWell(
        onTap: () {
          print('Click');
        },
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide.none),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardImage(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.32,
                        radius: [15, 15, 15, 15],
                        pads: [0, 0, 0, 0],
                        url: widget.image,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveText(
                              pads: [10, 0, 10, 0],
                              text: "Puerto Rico enacted strict Covid measures. It paid off, and it's a lesson for the mainland.",
                              lines: 3,
                              min: 18,
                              max: 20,
                              isBold: true,
                              isItalic: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
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
                                            text: "Mirror Online The",
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
                                  Expanded(
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
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Badge(
                          toAnimate: false,
                          badgeColor: Colors.green,
                          badgeContent: Text("Science", style: GoogleFonts.roboto(fontSize: 16, color: Colors.white)),
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
