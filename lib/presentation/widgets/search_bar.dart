import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLinerSearchBar extends StatefulWidget {
  final ValueChanged<String> onTextSearched, onTextChanged;

  const TimeLinerSearchBar({Key key, this.onTextSearched, this.onTextChanged}) : super(key: key);
  @override
  _TimeLinerSearchBarState createState() => _TimeLinerSearchBarState();
}

class _TimeLinerSearchBarState extends State<TimeLinerSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClayContainer(
        borderRadius: 10,
        color: Theme.of(context).canvasColor,
        child: TextFormField(
          style: GoogleFonts.roboto(
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
          cursorColor: Theme.of(context).accentColor,
          cursorWidth: 3,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.visiblePassword,
          onFieldSubmitted: (value) {
            widget.onTextSearched(value);
          },
          onChanged: (value) {
            widget.onTextChanged(value);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
            hintText: 'Articles, Intrests and More',
            hintMaxLines: 1,
            hintTextDirection: TextDirection.ltr,
            hintStyle: GoogleFonts.roboto(fontSize: 18, decoration: TextDecoration.none),
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
