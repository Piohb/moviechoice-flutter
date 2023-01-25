import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'MOVIE CHOICE';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        fontFamily: primaryFont,
      ),
      home: Menu(title: title),
    );
  }
}