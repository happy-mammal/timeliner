import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/basic/capsule_item.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/cards/capsule_card.dart';
import 'package:timeliner/ui/widgets/cards/jumbo_card.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/ui/widgets/compos/top_news.dart';
import 'package:timeliner/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppStrings ast = AppStrings();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAppBar(pads: [20, 10, 20, 10], title: ast.homeNames[0], profile: ast.profileUrl),
            TopNewsList(pads: [0, 0, 0, 0]),
            ResponsiveText(text: ast.homeNames[2], min: 28, max: 30, lines: 1, pads: [20, 5, 20, 5], isBold: true, isItalic: false),
            CapsuleCard(
              pads: [12, 5, 12, 5],
              heading: "FROM SOURCE YOU FOLLOW",
              title: "Abbotsford News",
              items: <CapsuleCardItem>[
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
              ],
            ),
            CapsuleCard(
              pads: [12, 5, 12, 5],
              heading: "FROM CATEGORY YOU LIKE",
              title: "Technology",
              items: <CapsuleCardItem>[
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
                CapsuleCardItem(
                  image: ast.imageUrls[0],
                  content: "Why is there no COVID vaccine for kids yet? A B.C. researcher breaks it down",
                ),
              ],
            ),
            ResponsiveText(text: ast.homeNames[1], min: 28, max: 30, lines: 1, pads: [20, 5, 20, 5], isBold: true, isItalic: false),
            JumboCard(pads: [12, 5, 12, 5], image: ast.imageUrls[0]),
            JumboCard(pads: [12, 5, 12, 5], image: ast.imageUrls[0]),
            JumboCard(pads: [12, 5, 12, 5], image: ast.imageUrls[0]),
            JumboCard(pads: [12, 5, 12, 5], image: ast.imageUrls[0]),
          ],
        ),
      ),
    );
  }
}
