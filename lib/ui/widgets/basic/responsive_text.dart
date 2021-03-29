import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveText extends StatefulWidget {
  final List<double> pads;
  final String text;
  final double min, max;
  final int lines;
  final bool isBold, isItalic;

  const ResponsiveText({Key key, this.pads, this.text, this.min, this.max, this.lines, this.isBold, this.isItalic}) : super(key: key);
  @override
  _ResponsiveTextState createState() => _ResponsiveTextState();
}

class _ResponsiveTextState extends State<ResponsiveText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.pads[0], widget.pads[1], widget.pads[2], widget.pads[3]),
      child: AutoSizeText(
        widget.text,
        minFontSize: widget.min,
        maxFontSize: widget.max,
        maxLines: widget.lines,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          fontStyle: widget.isItalic ? FontStyle.italic : FontStyle.normal,
          fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}