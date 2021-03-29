import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeliner/utils/app_colors.dart';

class TimeLinerSearchBar extends StatefulWidget {
  final ValueChanged<String> onTextSearched;

  const TimeLinerSearchBar({Key key, this.onTextSearched}) : super(key: key);

  @override
  _TimeLinerSearchBarState createState() => _TimeLinerSearchBarState();
}

class _TimeLinerSearchBarState extends State<TimeLinerSearchBar> {
  @override
  Widget build(BuildContext context) {
    AppColors acl = AppColors();
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        style: GoogleFonts.roboto(
          fontSize: 18,
          decoration: TextDecoration.none,
        ),
        cursorColor: acl.colors[4],
        cursorWidth: 3,
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {
          widget.onTextSearched(value);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_rounded,
            color: acl.colors[4],
            size: 30,
          ),
          hintText: 'Articles, Intrests and More',
          hintMaxLines: 1,
          hintTextDirection: TextDirection.ltr,
          hintStyle: GoogleFonts.roboto(fontSize: 18, decoration: TextDecoration.none),
          filled: true,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
