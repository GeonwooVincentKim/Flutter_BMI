import 'package:flutter/material.dart';
import 'package:flutter_bmi/app_screens/BMI/BMI.dart';
import 'package:flutter_bmi/app_screens/TODOList/TODOList.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
      // home: BMI(),
    );
  }
}

class Todo{
  bool isDone = false;
  String title;

  Todo(this.title);
}