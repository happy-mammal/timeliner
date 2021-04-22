import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/intrest_chip.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/cards/tiny_card.dart';
import 'package:timeliner/utils/app_strings.dart';

class ViewArticleScreen extends StatefulWidget {
  @override
  _ViewArticleScreenState createState() => _ViewArticleScreenState();
}

class _ViewArticleScreenState extends State<ViewArticleScreen> {
  @override
  Widget build(BuildContext context) {
    AppStrings ast = AppStrings();
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImage(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                pads: [0, 0, 0, 0],
                radius: [0, 0, 0, 0],
                url: ast.imageUrls[0],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Badge(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.access_time_rounded),
                        SizedBox(width: 10),
                        ResponsiveText(
                          text: "23 March 2021",
                          max: 16,
                          min: 16,
                          lines: 1,
                          isBold: true,
                          isItalic: false,
                          pads: [0, 0, 0, 0],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ResponsiveText(
                text: "Puerto Rico enacted strict Covid measures. It paid off, and it's a lesson for the mainland.",
                max: 22,
                min: 22,
                lines: 5,
                isBold: true,
                isItalic: false,
                pads: [20, 5, 20, 10],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.settings_input_antenna_rounded, color: Colors.blue),
                        SizedBox(width: 10),
                        ResponsiveText(
                          text: "CNBS News",
                          max: 16,
                          min: 16,
                          lines: 1,
                          isBold: false,
                          isItalic: false,
                          pads: [0, 0, 0, 0],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.open_in_new_rounded, color: Colors.blue),
                        SizedBox(width: 10),
                        ResponsiveText(
                          text: "Visit Website",
                          max: 16,
                          min: 16,
                          lines: 1,
                          isBold: false,
                          isItalic: false,
                          pads: [0, 0, 0, 0],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1,
                height: 1,
              ),
              ResponsiveText(
                text: "Puerto Rico kept Covid-19 cases and deaths down with strict curfews, lockdowns and sanitary measures, moves the island's residents saw as nonpolitical and adopted.",
                max: 18,
                min: 18,
                lines: 20,
                isBold: false,
                isItalic: false,
                pads: [20, 10, 20, 0],
              ),
              ResponsiveText(
                text:
                    "Janny Rodriguez, 47, a community leader in the neighborhood of Barreal in Peñuelas, Puerto Rico, is an operations supervisor at an asphalt plant. During the height of the pandemic last March, he couldn't stop working, since he's one of a few workers.",
                max: 18,
                min: 18,
                lines: 20,
                isBold: false,
                isItalic: false,
                pads: [20, 10, 20, 10],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.read_more_rounded, color: Colors.blue, size: 34),
                    ResponsiveText(
                      text: "Click here to read more.",
                      max: 18,
                      min: 18,
                      lines: 20,
                      isBold: true,
                      isItalic: false,
                      pads: [20, 10, 20, 10],
                    ),
                  ],
                ),
              ),
              CardImage(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                pads: [15, 15, 15, 15],
                radius: [15, 15, 15, 15],
                url: ast.imageUrls[0],
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1,
                height: 1,
              ),
              ResponsiveText(
                text: "More Intrests",
                max: 26,
                min: 26,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [20, 5, 20, 0],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                      IntrestChip(label: "Covid", color: Colors.green[600]),
                    ],
                  ),
                ),
              ),
              ResponsiveText(
                text: "More From Source",
                max: 26,
                min: 26,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [20, 5, 20, 0],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TinyCard(hasBadge: true, hasSource: false, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: false, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: false, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: false, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: false, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                    ],
                  ),
                ),
              ),
              ResponsiveText(
                text: "More From Category",
                max: 26,
                min: 26,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [20, 5, 20, 0],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TinyCard(hasBadge: false, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: false, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: false, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: false, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: false, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                    ],
                  ),
                ),
              ),
              ResponsiveText(
                text: "From Similar Intrest",
                max: 26,
                min: 26,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [20, 5, 20, 0],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TinyCard(hasBadge: true, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                      TinyCard(hasBadge: true, hasSource: true, pads: [2, 10, 2, 20], image: ast.imageUrls[0]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
