import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/cards/carousel_card.dart';
import 'package:timeliner/utils/app_strings.dart';

class TopNewsList extends StatefulWidget {
  final List<double> pads;

  const TopNewsList({Key key, this.pads}) : super(key: key);
  @override
  _TopNewsListState createState() => _TopNewsListState();
}

class _TopNewsListState extends State<TopNewsList> {
  @override
  Widget build(BuildContext context) {
    AppStrings ast = AppStrings();
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CarouselCard(pads: [8, 0, 0, 10], image: ast.imageUrls[0]),
            CarouselCard(pads: [8, 0, 0, 10], image: ast.imageUrls[0]),
            CarouselCard(pads: [8, 0, 0, 10], image: ast.imageUrls[0]),
            CarouselCard(pads: [8, 0, 0, 10], image: ast.imageUrls[0]),
            CarouselCard(pads: [8, 0, 0, 10], image: ast.imageUrls[0]),
          ],
        ),
      ),
    );
  }
}
