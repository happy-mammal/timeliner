import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeliner/business_logic/blocs/user/user_bloc.dart';
import 'package:timeliner/presentation/widgets/checkbox_card.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';

class SetupPage extends StatefulWidget {
  final Map<String, String> data;

  const SetupPage({Key key, this.data}) : super(key: key);

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  List<bool> isChoosed = [false, false, false, false, false, false];
  List<IconData> icon = [
    Icons.sports_volleyball_rounded,
    Icons.lightbulb,
    Icons.language_rounded,
    Icons.flag_rounded,
    Icons.science_rounded,
    Icons.local_hospital_rounded,
  ];
  List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple, Colors.pink];
  List<String> title = ["Sports", "Technology", "World", "Nation", "Science", "Health"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeLinerResponsiveText(
                  text: "Welcome",
                  isBold: false,
                  isItalic: false,
                  max: 40,
                  min: 40,
                  lines: 1,
                  pads: [25, 25, 10, 5],
                  color: null,
                ),
                TimeLinerResponsiveText(
                  text: widget.data["name"],
                  isBold: true,
                  isItalic: false,
                  max: 40,
                  min: 40,
                  lines: 1,
                  pads: [25, 5, 10, 5],
                  color: null,
                ),
              ],
            ),
            TimeLinerResponsiveText(
              text: "Let's have a quick setup. Choose atleast 3 topics to Get Started.",
              isBold: false,
              isItalic: false,
              max: 20,
              min: 20,
              lines: 2,
              pads: [25, 15, 15, 5],
              color: null,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                primary: true,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  6,
                  (index) {
                    return TimeLinerCheckBoxCard(
                      pads: [10, 10, 10, 10],
                      text: title[index],
                      icon: icon[index],
                      color: colors[index],
                      isChecked: isChoosed[index],
                      onPressed: () {
                        setState(() {
                          isChoosed[index] ? isChoosed[index] = false : isChoosed[index] = true;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  print('CLICKED HURRAY');
                  BlocProvider.of<UserBloc>(context).add(CreateUserAccountEvent(
                    widget.data["uid"],
                    widget.data["email"],
                    widget.data["name"],
                    widget.data["photoURL"],
                  ));
                },
                child: BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is CreateUserSuccessfull) {
                      List<String> cats = [];
                      for (var i = 0; i < isChoosed.length; i++) {
                        if (isChoosed[i]) {
                          cats.add('"' + title[i] + '"');
                        }
                      }
                      BlocProvider.of<UserBloc>(context).add(AddIntrestsEvent(cats, widget.data["uid"]));
                    } else if (state is AddIntrestsSuccessfull) {
                      Navigator.of(context).pushReplacementNamed('/home', arguments: {"uid": widget.data["uid"]});
                    }
                  },
                  child: ClayContainer(
                    borderRadius: 20,
                    color: Theme.of(context).canvasColor,
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Shimmer.fromColors(
                      highlightColor: Color(0xFF00d2ff),
                      baseColor: Color(0xFF3a7bd5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimeLinerResponsiveText(
                            text: "Hooray Let's Go",
                            max: 25,
                            min: 25,
                            lines: 1,
                            pads: [5, 5, 5, 5],
                            color: null,
                            isBold: true,
                            isItalic: false,
                          ),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.blueAccent,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
