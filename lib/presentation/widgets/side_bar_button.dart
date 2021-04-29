import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class TimeLinerSideBarButton extends StatefulWidget {
  final dynamic icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onButtonPressed;

  const TimeLinerSideBarButton({Key key, this.icon, this.iconColor, this.iconSize, this.onButtonPressed}) : super(key: key);
  @override
  _TimeLinerSideBarButtonState createState() => _TimeLinerSideBarButtonState();
}

class _TimeLinerSideBarButtonState extends State<TimeLinerSideBarButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onButtonPressed();
      },
      child: ClayContainer(
        width: 60,
        height: 60,
        borderRadius: 15,
        color: Theme.of(context).canvasColor,
        child: Center(
          child: widget.icon is IconData
              ? Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: widget.iconColor,
                )
              : CircleAvatar(
                  radius: widget.iconSize / 19,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(widget.icon),
                ),
        ),
      ),
    );
  }
}
