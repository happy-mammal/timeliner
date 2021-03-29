import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStrings {
  List bnbNames = <Widget>[
    Text('Home', style: GoogleFonts.roboto()),
    Text('Search', style: GoogleFonts.roboto()),
    Text('Library', style: GoogleFonts.roboto()),
    Text('Pinned', style: GoogleFonts.roboto()),
  ];

  String profileUrl = 'https://e3.365dm.com/21/02/2048x1152/skynews-elon-musk_5257586.jpg';

  List imageUrls = <String>[
    'https://starwalk.space/gallery/images/may-2020-starlink-satellites/1920x1080',
  ];
  List homeNames = <String>["Stories", "Top Trending", "Suggested Feed", "Curated For You"];
  List searchNames = <String>["Search", "Top Trending", "Suggested Feed", "Curated For You"];
}
