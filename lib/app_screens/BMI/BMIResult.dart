import 'package:flutter/material.dart';

class BMIResults extends StatelessWidget{
  final double height;
  final double weight;
  BMIResults(this.height, this.weight);

  String _calcBMI(double bmi){
    var result = 'Low weight';
    if (bmi >= 35){
      result = 'extremely obese';
    } else if (bmi >= 30){
      result = 'Lv.2 Obese';
    } else if (bmi >= 25){
      result = 'Lv.2 Obese';
    } else if (bmi >= 23){
      result = 'Over weight';
    } else if (bmi >= 18.5){
      result = 'Normal';
    }
    return result;
  }

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