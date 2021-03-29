import 'package:flutter/material.dart';

class CardImage extends StatefulWidget {
  final List<double> pads, radius;
  final double width, height;
  final String url;

  const CardImage({Key key, this.pads, this.radius, this.width, this.height, this.url}) : super(key: key);
  @override
  _CardImageState createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(widget.url),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.radius[0]),
            topRight: Radius.circular(widget.radius[1]),
            bottomRight: Radius.circular(widget.radius[2]),
            bottomLeft: Radius.circular(widget.radius[3]),
          ),
        ),
      ),
    );
  }
}
