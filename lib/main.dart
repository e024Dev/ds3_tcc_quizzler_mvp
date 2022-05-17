import 'package:ds3_tcc_quizzler_mvp/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          secondary: Color(0xFFfff176),
        ),
      ),
      home: HomePage(),
    );
  }
}
