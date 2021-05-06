import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class ChipButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onChipTap;
  final double width;
  const ChipButton({
    Key key,
    this.text,
    this.icon,
    this.onChipTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChipTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClayContainer(
          width: MediaQuery.of(context).size.width * width,
          color: Theme.of(context).canvasColor,
          borderRadius: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                child: Icon(icon, size: 30),
              ),
              Expanded(
                child: TimeLinerResponsiveText(
                  text: text,
                  min: 20,
                  max: 20,
                  lines: 1,
                  isBold: true,
                  isItalic: false,
                  pads: [8, 8, 8, 8],
                  color: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
