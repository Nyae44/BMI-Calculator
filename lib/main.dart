// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xff0A0E21),
        ),
        // colorScheme:
        //  ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      ),
      home: InputPage(),
    );
  }
}
