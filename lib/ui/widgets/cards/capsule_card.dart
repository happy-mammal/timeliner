import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/basic/capsule_item.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class CapsuleCard extends StatefulWidget {
  final List<double> pads;
  final String heading, title;
  final List data;

  const CapsuleCard({Key key, this.pads, this.heading, this.title, this.data}) : super(key: key);
  @override
  _CapsuleCardState createState() => _CapsuleCardState();
}

class _CapsuleCardState extends State<CapsuleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveText(
                text: widget.heading,
                max: 16,
                min: 14,
                lines: 1,
                pads: [15, 10, 0, 5],
                isBold: false,
                isItalic: false,
              ),
              ResponsiveText(
                text: widget.title,
                max: 26,
                min: 24,
                lines: 1,
                pads: [15, 10, 0, 5],
                isBold: true,
                isItalic: false,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return CapsuleCardItem(
                      image: widget.data[index]["image"],
                      content: widget.data[index]["title"],
                      category: widget.data[index]["category"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
