import 'package:flutter/material.dart';
import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/cards/carousel_card.dart';
import 'package:timeliner/ui/widgets/cards/search_card.dart';
import 'package:timeliner/ui/widgets/compos/search_bar.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/utils/app_strings.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

String queryText = "";

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    AppStrings ast = AppStrings();
    Column searchColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );

    searchColumn.children.add(
      TopAppBar(pads: [20, 10, 20, 10], title: ast.searchNames[0], profile: ast.profileUrl),
    );
    searchColumn.children.add(
      TimeLinerSearchBar(
        onTextSearched: (value) {
          setState(() {
            queryText = value;
          });
          ouputData(queryText, searchColumn, ast);
        },
      ),
    );

    ouputData(queryText, searchColumn, ast);

    return Scaffold(
      body: SingleChildScrollView(child: searchColumn),
    );
  }

  ouputData(q, searchColumn, ast) {
    if (q.isEmpty) {
      print('EMPTY');
      searchColumn.children.add(
        ResponsiveText(text: ast.searchNames[1], min: 24, max: 26, lines: 1, pads: [20, 10, 20, 5], isBold: true, isItalic: false),
      );
      for (var i = 0; i < 3; i++) {
        searchColumn.children.add(SearchCard(
          pads: [10, 10, 10, 10],
          image: ast.imageUrls[0],
        ));
      }
    } else {
      print('SOMEDATA');
      searchColumn.children.add(
        ResponsiveText(text: ast.searchNames[2] + q, min: 24, max: 26, lines: 1, pads: [20, 10, 20, 5], isBold: true, isItalic: false),
      );
      for (var i = 0; i < q.length; i++) {
        searchColumn.children.add(CarouselCard(image: ast.imageUrls[0], pads: [0, 0, 0, 0]));
      }
    }
  }
}
