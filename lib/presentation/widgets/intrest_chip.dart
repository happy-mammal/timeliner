import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class TimeLinerIntrestChip extends StatefulWidget {
  final String text;
  final double width, height;
  final VoidCallback onPrefixPressed, onSuffixPressed;
  final bool isLoading;
  final IconData prefixIcon, suffixIcon;

  const TimeLinerIntrestChip({Key key, this.text, this.width, this.height, this.isLoading, this.onPrefixPressed, this.onSuffixPressed, this.prefixIcon, this.suffixIcon}) : super(key: key);
  @override
  _TimeLinerIntrestChipState createState() => _TimeLinerIntrestChipState();
}

class _TimeLinerIntrestChipState extends State<TimeLinerIntrestChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClayContainer(
        width: widget.width,
        color: Theme.of(context).canvasColor,
        borderRadius: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.isLoading
              ? Shimmer.fromColors(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  baseColor: Theme.of(context).canvasColor,
                  highlightColor: Theme.of(context).backgroundColor)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.onPrefixPressed();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          widget.prefixIcon,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: TimeLinerResponsiveText(
                        text: widget.text,
                        min: 18,
                        max: 18,
                        lines: 1,
                        isBold: true,
                        isItalic: false,
                        pads: [8, 8, 0, 8],
                        color: null,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.onSuffixPressed();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                        child: Icon(
                          widget.suffixIcon,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
