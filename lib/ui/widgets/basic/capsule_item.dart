import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/ui/widgets/basic/card_image.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class CapsuleCardItem extends StatefulWidget {
  final String image, content;

  const CapsuleCardItem({Key key, this.image, this.content}) : super(key: key);
  @override
  _CapsuleCardItemState createState() => _CapsuleCardItemState();
}

class _CapsuleCardItemState extends State<CapsuleCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardImage(
            radius: [10, 10, 10, 10],
            pads: [0, 0, 10, 0],
            url: widget.image,
            width: 70,
            height: 70,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Badge(
                  badgeContent: Text(
                    'Technology',
                    style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                  ),
                  toAnimate: false,
                  shape: BadgeShape.square,
                  borderRadius: BorderRadius.circular(6),
                  badgeColor: Colors.purple,
                ),
              ),
              ResponsiveText(
                pads: [0, 0, 0, 0],
                text: widget.content,
                min: 15,
                max: 17,
                lines: 2,
                isBold: false,
                isItalic: false,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
