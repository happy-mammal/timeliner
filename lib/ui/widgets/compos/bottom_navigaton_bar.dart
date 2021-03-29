import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/utils/app_colors.dart';
import 'package:timeliner/utils/app_icons.dart';
import 'package:timeliner/utils/app_strings.dart';

class BottomNavigatonBar extends StatefulWidget {
  final ValueChanged<int> onCurrentIndexChanged;
  final int getCurrentIndex;

  const BottomNavigatonBar({Key key, this.onCurrentIndexChanged, this.getCurrentIndex}) : super(key: key);

  @override
  _BottomNavigatonBarState createState() => _BottomNavigatonBarState();
}

class _BottomNavigatonBarState extends State<BottomNavigatonBar> {
  @override
  Widget build(BuildContext context) {
    AppIcons ai = AppIcons();
    AppStrings ast = AppStrings();
    AppColors cl = AppColors();

    List icons = ai.bnbIcons;
    List titles = ast.bnbNames;
    List colors = cl.colors;

    return BottomNavyBar(
      showElevation: false,
      itemCornerRadius: 15,
      curve: Curves.elasticOut,
      animationDuration: Duration(milliseconds: 1000),
      selectedIndex: widget.getCurrentIndex,
      onItemSelected: (index) {
        setState(() {
          widget.onCurrentIndexChanged(index);
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(icon: icons[0], title: titles[0], inactiveColor: colors[0], activeColor: colors[4]),
        BottomNavyBarItem(icon: icons[1], title: titles[1], inactiveColor: colors[1], activeColor: colors[4]),
        BottomNavyBarItem(icon: icons[2], title: titles[2], inactiveColor: colors[2], activeColor: colors[4]),
        BottomNavyBarItem(icon: icons[3], title: titles[3], inactiveColor: colors[3], activeColor: colors[4]),
      ],
    );
  }
}
