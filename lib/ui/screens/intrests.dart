import 'package:flutter/material.dart';

import 'package:timeliner/ui/widgets/basic/responsive_text.dart';
import 'package:timeliner/ui/widgets/cards/jumbo_card.dart';
import 'package:timeliner/ui/widgets/compos/top_app_bar.dart';
import 'package:timeliner/utils/app_strings.dart';

class IntrestsScreen extends StatefulWidget {
  @override
  _IntrestsScreenState createState() => _IntrestsScreenState();
}

class _IntrestsScreenState extends State<IntrestsScreen> {
  AppStrings ast = AppStrings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(pads: [20, 10, 20, 10], title: ast.intrestNames[0], profile: ast.profileUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    intresetCards(),
                    intresetCards(),
                    intresetCards(),
                    intresetCards(),
                    intresetCards(),
                    intresetCards(),
                  ],
                ),
              ),
            ),
            JumboCard(image: ast.imageUrls[0], pads: [10, 5, 10, 5]),
            JumboCard(image: ast.imageUrls[0], pads: [10, 5, 10, 5]),
            JumboCard(image: ast.imageUrls[0], pads: [10, 5, 10, 5]),
            JumboCard(image: ast.imageUrls[0], pads: [10, 5, 10, 5]),
          ],
        ),
      ),
    );
  }

  Widget intresetCards() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: ResponsiveText(
            text: 'iPhone 13',
            pads: [10, 10, 10, 10],
            max: 22,
            min: 20,
            lines: 1,
            isBold: true,
            isItalic: false,
          ),
        ),
      ),
    );
  }
}
