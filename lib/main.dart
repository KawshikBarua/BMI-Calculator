import 'package:flutter/material.dart';
import 'package:bmi/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calulator',
      home: HomeScreen(),
    );
  }
}
