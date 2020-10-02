import 'package:flutter/material.dart';
import 'package:flutter_bmi/app_screens/BMI/BMI.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMI(),
    );
  }
}