import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class TimeLinerProfileButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onButtonPressed;

  const TimeLinerProfileButton({Key key, this.icon, this.text, this.onButtonPressed}) : super(key: key);
  @override
  _TimeLinerProfileButtonState createState() => _TimeLinerProfileButtonState();
}

class _TimeLinerProfileButtonState extends State<TimeLinerProfileButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(
        onTap: () {
          widget.onButtonPressed();
        },
        child: ClayContainer(
          width: MediaQuery.of(context).size.width,
          borderRadius: 14,
          color: Theme.of(context).canvasColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        widget.icon,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      Expanded(
                        child: TimeLinerResponsiveText(
                          text: widget.text,
                          min: 20,
                          max: 20,
                          lines: 1,
                          isBold: true,
                          isItalic: false,
                          color: null,
                          pads: [10, 20, 10, 20],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.navigate_next_rounded,
                  size: 30,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
