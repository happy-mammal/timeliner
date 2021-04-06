import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatefulWidget {
  final List<double> pads;
  final String image;
  const CarouselCard({Key key, this.pads, this.image}) : super(key: key);
  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/viewarticle', (route) => false);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Badge(
                        toAnimate: false,
                        badgeContent: Text(
                          'Science',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(6),
                        badgeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
