// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/neural_network/neural_network.dart';
import 'package:sklite/utils/io.dart';
import 'package:tumaris/questions/age.dart';
import 'package:tumaris/models/test_result.dart';

MLPClassifier mlp;

void main(){
  runApp(
      new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: new DepressionDetection(),
      )
  );
}

class DepressionDetection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DepressionDetectionState();
  }
}

class DepressionDetectionState extends State<DepressionDetection>{

  DepressionDetectionState() {
    loadModel("images/mlp.json").then((x) {
      mlp = MLPClassifier.fromMap(json.decode(x));
    });
  }

  @override
  Widget build(BuildContext context) {
    final testResult = new TestResult(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1);

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text("Послеродовая депрессия"),
      ),


      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new MaterialButton(
                height: 50.0,
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context)=> new AgeQuestion(testResult: testResult)));
                },
                child: new Text("Пройти тест",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                  ),)
            ),

            SizedBox(height: 100),

            new Image.asset(
              "images/robot.png",
              height: 250,
            ),
          ],
        ),
      ),


    );
  }
}