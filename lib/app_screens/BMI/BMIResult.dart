import 'package:flutter/material.dart';

class BMIResults extends StatelessWidget{
  final double height;
  final double weight;
  BMIResults(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Normal",
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 16),
            Icon(
              Icons.sentiment_satisfied,
              color: Colors.green,
              size: 100,
            ),
          ]
        ),
      ),
    );
  }
  
}