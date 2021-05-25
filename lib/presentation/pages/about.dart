import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimeLinerResponsiveText(
                text: "About Developer",
                min: 30,
                max: 30,
                lines: 1,
                isBold: true,
                isItalic: false,
                pads: [20, 20, 20, 10],
                color: null,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: ClayContainer(
                    borderRadius: 20,
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/78479679?v=4"),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TimeLinerResponsiveText(
                                  text: "Yash Lalit",
                                  min: 28,
                                  max: 28,
                                  lines: 1,
                                  isBold: true,
                                  isItalic: false,
                                  pads: [20, 0, 20, 10],
                                  color: null,
                                ),
                                TimeLinerResponsiveText(
                                  text: "Full Stack Developer",
                                  min: 18,
                                  max: 18,
                                  lines: 1,
                                  isBold: false,
                                  isItalic: false,
                                  pads: [20, 5, 20, 10],
                                  color: null,
                                ),
                                Divider(
                                  endIndent: 20,
                                  indent: 20,
                                ),
                                TimeLinerResponsiveText(
                                  text: "Mobile . Web . Desktop",
                                  min: 15,
                                  max: 15,
                                  lines: 1,
                                  isBold: false,
                                  isItalic: false,
                                  pads: [20, 5, 20, 10],
                                  color: null,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClayContainer(
                  borderRadius: 20,
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeLinerResponsiveText(
                        text: "What I Do ?",
                        min: 20,
                        max: 20,
                        lines: 1,
                        isBold: true,
                        isItalic: false,
                        pads: [20, 20, 20, 0],
                        color: null,
                      ),
                      TimeLinerResponsiveText(
                        text:
                            "A Flutter Enthusiast, Full Stack Developer and Computer Engineering undergraduate at MES PCE.\n\nI love developing 'cross-platform' applications using Flutter for mobile and web.\n\nI am a passionate and quick learner of new technologies which helps in building reliable and scalable apps.\n\nI love adopting to new technologies and eager to implement the same in any of my work or projects.",
                        min: 16,
                        max: 16,
                        lines: 20,
                        isBold: false,
                        isItalic: false,
                        pads: [20, 20, 20, 20],
                        color: null,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClayContainer(
                  borderRadius: 20,
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeLinerResponsiveText(
                        text: "My Work",
                        min: 20,
                        max: 20,
                        lines: 1,
                        isBold: true,
                        isItalic: false,
                        pads: [20, 20, 20, 0],
                        color: null,
                      ),
                      TimeLinerResponsiveText(
                        text: "Check out my GitHub Repository to explore my work.\n\nDo consider following me if you like my work.",
                        min: 16,
                        max: 16,
                        lines: 20,
                        isBold: false,
                        isItalic: false,
                        pads: [20, 20, 20, 0],
                        color: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: SignInButton(
                            buttonType: ButtonType.github,
                            btnText: "View GitHub Repo",
                            onPressed: () async {
                              await canLaunch("https://github.com/happy-mammal") ? await launch("https://github.com/happy-mammal") : throw 'Could not launch link';
                            },
                            buttonSize: ButtonSize.large,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClayContainer(
                  borderRadius: 20,
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeLinerResponsiveText(
                        text: "Connect With Me",
                        min: 20,
                        max: 20,
                        lines: 1,
                        isBold: true,
                        isItalic: false,
                        pads: [20, 20, 20, 0],
                        color: null,
                      ),
                      TimeLinerResponsiveText(
                        text: "Are you looking to hire someone ?\nDo check out my profile/portfolio on LinkedIn.\n\nJust liked my work ? Connect with me on LinkedIn.",
                        min: 16,
                        max: 16,
                        lines: 20,
                        isBold: false,
                        isItalic: false,
                        pads: [20, 20, 20, 0],
                        color: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: SignInButton(
                            buttonType: ButtonType.linkedin,
                            btnText: "Connect With Me",
                            onPressed: () async {
                              await canLaunch("https://www.linkedin.com/in/yash-lalit-0a6a6320b/") ? await launch("https://www.linkedin.com/in/yash-lalit-0a6a6320b/") : throw 'Could not launch link';
                            },
                            buttonSize: ButtonSize.large,
                          ),
                        ),
                      )
                    ],
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
