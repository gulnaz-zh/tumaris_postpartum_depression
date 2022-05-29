import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';
import 'package:tumaris/questions/desiredpreg.dart';

var healthproblems = {
  "не было": 9,
  "да, высокое давление / аритмия" : 1,
  "да, сахарный диабет / щитовидная железа": 2,
  "да, аутоиммунное заболевание": 3,
  "да, кисты почек": 4,
  "да, астма": 5,
  "да, язва желудка": 6,
  "да, ревматоидный артрит": 7,
  "да, анемия": 8,
  "да, другое": 10,
  "да, предпочту не делится": 11,
};

class HealthProblemQuestion extends StatefulWidget {
  final TestResult testResult;
  HealthProblemQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  State<HealthProblemQuestion> createState() => _HealthProblemQuestionState();
}

class _HealthProblemQuestionState extends State<HealthProblemQuestion> {
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("3/10"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Были ли у вас проблемы со здоровьем раньше?"),
              new Padding(padding: EdgeInsets.all(30.0)),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: TextField(
              //     controller: _fieldController,
              //     autofocus: true,
              //     cursorColor: Colors.teal,
              //   ),
              // ),
    FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
          // labelStyle: textStyle,
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: 'Please select expense',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0))),
        isEmpty: _currentSelectedValue == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _currentSelectedValue,
            isDense: true,
            onChanged: (String? newValue) {
              setState(() {
                _currentSelectedValue = newValue;
                state.didChange(newValue);
              });
            },
            items: healthproblems.keys.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
    ),
              new Padding(padding: EdgeInsets.all(30.0)),
              RaisedButton(
                  child: Text("Продолжить"),
                  onPressed: () {
                    widget.testResult.healthProblem = healthproblems[_currentSelectedValue]!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DesiredPregQuestion(testResult: widget.testResult)));
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