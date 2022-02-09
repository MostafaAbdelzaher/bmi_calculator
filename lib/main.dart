import 'package:bmi_calculator/screens/bmi_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0C1234),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF12153B),
          )),
      home: BMICALCULATOR(),
    );
  }
}
