import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';

import 'maritalstatus.dart';

var options = {
  "меньше чем 200 долларов (USD)": 1,
  "между 200 и 400": 2,
  "между 400 и 600": 3,
  "между 600 и 800": 4,
  "больше чем 800": 5,
  "нет прибыли": 6
};

class IncomeQuestion extends StatefulWidget {
  final TestResult testResult;
  IncomeQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  State<IncomeQuestion> createState() => _IncomeQuestionState();
}

class _IncomeQuestionState extends State<IncomeQuestion> {
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("7/10"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Ваш уровень прибыли: "),
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
                    widget.testResult.income = options[_currentSelectedValue]!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MaritalQuestion(testResult: widget.testResult)));
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