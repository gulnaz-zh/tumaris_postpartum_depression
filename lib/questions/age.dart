import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';
import 'package:tumaris/questions/pregweek.dart';

class AgeQuestion extends StatelessWidget {
  final TestResult testResult;
  AgeQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _fieldController = new TextEditingController();
    _fieldController.text = "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("1/10"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ваш возраст: "),
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
                testResult.age = int.parse(_fieldController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PregWeekQuestion(testResult: testResult)));
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