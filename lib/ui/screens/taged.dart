import 'package:flutter/material.dart';
import 'package:timeline_widget/timeline_widget.dart';
import 'package:timeliner/ui/widgets/cards/timeline_card.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/utils/app_strings.dart';

class TagedScreen extends StatefulWidget {
  @override
  _TagedScreenState createState() => _TagedScreenState();
}

class _TagedScreenState extends State<TagedScreen> {
  AppStrings ast = AppStrings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TopAppBar(pads: [20, 10, 20, 10], title: ast.pinnedNames[0], profile: ast.profileUrl),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: TimelineView(
                scrollController: ScrollController(initialScrollOffset: 200, keepScrollOffset: true),
                align: TimelineAlign.rightAlign,
                lineWidth: 4,
                lineColor: Colors.blue,
                imageBorderColor: Colors.blue,
                image: [
                  CircleAvatar(backgroundColor: Colors.blue),
                  CircleAvatar(backgroundColor: Colors.blue),
                  CircleAvatar(backgroundColor: Colors.blue),
                  CircleAvatar(backgroundColor: Colors.blue),
                  CircleAvatar(backgroundColor: Colors.blue),
                  CircleAvatar(backgroundColor: Colors.blue),
                ],
                height: 170,
                width: MediaQuery.of(context).size.width,
                imageHeight: 20,
                children: [
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                  TimelineCard(pads: [5, 0, 0, 0], image: ast.imageUrls[0]),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
