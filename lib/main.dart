import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/intro_app_ui.dart';
import 'package:intro_ui/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro UI',
      debugShowCheckedModeBanner: false,
      home: const IntroAppUi(),
      routes: {
        IntroPage.id: (context) => const IntroPage(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
