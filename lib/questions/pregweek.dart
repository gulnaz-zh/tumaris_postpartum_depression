import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';

import 'healthproblem.dart';

class PregWeekQuestion extends StatelessWidget {
  final TestResult testResult;
  PregWeekQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _fieldController = new TextEditingController();
    _fieldController.text = "";
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("2/10"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Неделя беременности: "),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _fieldController,
                  autofocus: true,
                  cursorColor: Colors.teal,
                ),
              ),
              RaisedButton(
                  child: Text("Продолжить"),
                  onPressed: () {
                    testResult.pregWeek = int.parse(_fieldController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HealthProblemQuestion(testResult: testResult)));
                  }),
              new Padding(padding: EdgeInsets.all(50.0)),

              new Image.asset(
                "images/robot.png",
                height: 250,
              ),
            ],
          ),
        )
    );
  }

}