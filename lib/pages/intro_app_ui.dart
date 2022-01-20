import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/services/string_utils.dart';

class IntroAppUi extends StatefulWidget {
  const IntroAppUi({Key? key}) : super(key: key);

  static const String id = "/intro_app_ui";

  @override
  _IntroAppUiState createState() => _IntroAppUiState();
}

class _IntroAppUiState extends State<IntroAppUi> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // #pages
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),

          if (_selectedIndex == 2)
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.08,
                right: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
            ),

          // //
          // #indicators
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                elementOfIndicator(0),
                const SizedBox(
                  width: 5,
                ),
                elementOfIndicator(1),
                const SizedBox(
                  width: 5,
                ),
                elementOfIndicator(2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({
    required String image,
    required String title,
    required String content,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // #title
          Text(
            title,
            style: const TextStyle(
                fontSize: 32, color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          // #content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),

          // #image
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              image,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget elementOfIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 6,
      width: (index == _selectedIndex) ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.red,
      ),
    );
  }
}
