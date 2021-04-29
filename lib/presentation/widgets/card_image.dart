import 'package:flutter/material.dart';

class TimeLinerCardImage extends StatefulWidget {
  final List<double> pads, radius;
  final double width, height;
  final String image;

  const TimeLinerCardImage({Key key, this.pads, this.radius, this.width, this.height, this.image}) : super(key: key);
  @override
  _TimeLinerCardImageState createState() => _TimeLinerCardImageState();
}

class _TimeLinerCardImageState extends State<TimeLinerCardImage> {
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
            image: NetworkImage(widget.image),
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
