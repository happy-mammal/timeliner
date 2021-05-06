import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:timeliner/presentation/widgets/profile_button.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, String> data;

  const ProfilePage({Key key, this.data}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          ClayContainer(
            borderRadius: 70,
            color: Theme.of(context).canvasColor,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(widget.data["photoURL"]),
            ),
          ),
          Center(
            child: TimeLinerResponsiveText(
              text: widget.data["name"],
              min: 30,
              max: 30,
              lines: 1,
              isBold: true,
              isItalic: false,
              color: null,
              pads: [10, 20, 10, 20],
            ),
          ),
          TimeLinerProfileButton(
            icon: Icons.star_rounded,
            text: "Rate Us",
            onButtonPressed: () {},
          ),
          TimeLinerProfileButton(
            icon: Icons.favorite_rounded,
            text: "Tell a friend",
            onButtonPressed: () {},
          ),
          TimeLinerProfileButton(
            icon: Icons.attach_money_rounded,
            text: "Donate",
            onButtonPressed: () {},
          ),
          TimeLinerProfileButton(
            icon: Icons.info_rounded,
            text: "About Developer",
            onButtonPressed: () {},
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
