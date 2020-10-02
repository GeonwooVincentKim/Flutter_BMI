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

  Widget _buildIcon(double bmi){
    if (bmi >= 23){
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5){
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print("bmi: $bmi");

    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _calcBMI(bmi),
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 16),
            _buildIcon(bmi),
          ]
        ),
      ),
    );
  }
  
}