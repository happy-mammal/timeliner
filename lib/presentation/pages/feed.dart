import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/feed_card.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var url = "https://cdn.iphoneincanada.ca/wp-content/uploads/2020/07/Big-Sur-Wallpaper.jpeg";
    return ListView(
      children: [
        TimeLinerFeedCard(height: height, width: width, url: url),
        TimeLinerFeedCard(height: height, width: width, url: url),
        TimeLinerFeedCard(height: height, width: width, url: url),
        TimeLinerFeedCard(height: height, width: width, url: url),
        TimeLinerFeedCard(height: height, width: width, url: url),
        TimeLinerFeedCard(height: height, width: width, url: url),
      ],
    );
  }
}
