import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';

import 'mentalhealth.dart';

var options = {
  "не замужем": 1,
  "замужем/в стабильных отношения": 2,
  "разведена": 3,
  "другое": 4
};

class MaritalQuestion extends StatefulWidget {
  final TestResult testResult;
  MaritalQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  State<MaritalQuestion> createState() => _MaritalQuestionState();
}

class _MaritalQuestionState extends State<MaritalQuestion> {
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("8/10"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Семейный статус: "),
              Padding(padding: EdgeInsets.all(30.0)),
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
                        items: options.keys.map((String value) {
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
                    widget.testResult.marital = options[_currentSelectedValue]!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentalQuestion(testResult: widget.testResult)));
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