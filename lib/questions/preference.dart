import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tumaris/models/test_result.dart';
import 'package:http/http.dart' as http;

import '../summary.dart';

var options = {
  "видео": 1,
  "аудио": 2,
  "текст": 3,
  "картинки": 4
};

class PreferenceQuestion extends StatefulWidget {
  final TestResult testResult;
  PreferenceQuestion({Key? key, required this.testResult}) : super(key: key);

  @override
  State<PreferenceQuestion> createState() => _PreferenceQuestionState();
}

class _PreferenceQuestionState extends State<PreferenceQuestion> {
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("10/10"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Какой формат контента вы предпочитаете? "),

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
                  child: Text("Завершить"),
                  onPressed: () {
                    print('here');
                 //   final url = Uri.parse('http://192.168.0.115/predict');
                //    var response = await http.post(url, body: widget.testResult.toJson());
                    var response = 0;
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: response, testResult: widget.testResult)));
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