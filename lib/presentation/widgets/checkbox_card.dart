import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class TimeLinerCheckBoxCard extends StatefulWidget {
  final bool isChecked;
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final List<double> pads;

  const TimeLinerCheckBoxCard({Key key, this.text, this.onPressed, this.pads, this.isChecked, this.icon, this.color}) : super(key: key);
  @override
  _TimeLinerCheckBoxCardState createState() => _TimeLinerCheckBoxCardState();
}

class _TimeLinerCheckBoxCardState extends State<TimeLinerCheckBoxCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        child: ClayContainer(
          borderRadius: 20,
          height: MediaQuery.of(context).size.height * 0.05,
          color: Theme.of(context).canvasColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(widget.isChecked ? Icons.done_outline_rounded : widget.icon, color: widget.color, size: 30),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
              ),
              TimeLinerResponsiveText(
                text: widget.text,
                isBold: true,
                isItalic: false,
                max: 20,
                min: 20,
                lines: 2,
                pads: [0, 10, 0, 10],
                color: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
