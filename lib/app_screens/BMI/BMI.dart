import 'package:flutter/material.dart';
import 'package:flutter_bmi/app_screens/BMI/BMIResult.dart';

class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BMIState();
  }
}

class _BMIState extends State<BMI> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void Dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Height",
                ),
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return "Please Input your Height";
                  }
                  return null;
                }
              ),
              SizedBox(
                height: 16.0
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Weight",
                ),
                // Controller for connect to results pages
                controller: _weightController,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return "Please Input your Weight";
                  }
                  return null;
                }
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMIResults(
                            double.parse(_heightController.text.trim()),
                            double.parse(_weightController.text.trim())
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Result"),
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}

