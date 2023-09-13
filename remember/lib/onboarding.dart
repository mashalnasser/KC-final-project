import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remember/email.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 109, 212),
              Color.fromARGB(255, 0, 238, 255),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    itemBuilder: (context, index) => OnboardContent(
                      animationPath: demo_data[index].animationPath,
                      title: demo_data[index].title,
                      description: demo_data[index].description,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 4,
                    ),
                    Spacer(),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageController.page == demo_data.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          } else {
                            _pageController.nextPage(
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 300),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String animationPath, title, description;

  Onboard({
    required this.animationPath,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    animationPath: "animeations/one.json.json",
    title: "remember",
    description: "This application helps people who have weak brain",
  ),
  Onboard(
    animationPath: "animeations/2.json.json",
    title: "What is your idea for the application?",
    description:
        "The simplicity of the application helps people to remind them to take their medications and buy medicines",
  ),
  Onboard(
    animationPath: "animeations/3.json.json",
    title: "What else is in the app?",
    description:
        "There is a Google map that will take you to the nearest hospital if you become ill",
  ),
];

class OnboardContent extends StatelessWidget {
  OnboardContent({
    Key? key,
    required this.animationPath,
    required this.title,
    required this.description,
  });

  final String animationPath;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(),
      Lottie.asset(
        animationPath,
        height: 250,
      ),
      Spacer(),
      Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500)),
      SizedBox(height: 16),
      Text(
        description,
        textAlign: TextAlign.center,
      ),
      Spacer(),
    ]);
  }
}
