import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';

class TopAppBar extends StatefulWidget {
  final List<double> pads;
  final String title, profile;

  const TopAppBar({Key key, this.pads, this.title, this.profile}) : super(key: key);
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResponsiveText(
            pads: [0, 0, 0, 0],
            text: widget.title,
            min: 28,
            max: 30,
            lines: 1,
            isBold: true,
            isItalic: false,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/settings', (route) => false);
            },
            child: CircleAvatar(
              radius: width / 19,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(widget.profile),
            ),
          ),
        ],
      ),
    );
  }
}
