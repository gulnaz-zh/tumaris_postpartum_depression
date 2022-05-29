// @dart=2.9
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/neural_network/neural_network.dart';
import 'package:sklite/utils/io.dart';
import 'models/test_result.dart';
import 'main.dart';
import 'package:sklite/utils/mathutils.dart' as mathutils;


class Summary extends StatefulWidget {
  var score;
  final TestResult testResult;
  Summary({Key key, this.score, this.testResult}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  // var data = getData('http://10.0.2.2:5000/');
  // var decodedData = jsonDecode(data);
  // print(decodedData['query']);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              new Text("Результат: ${predict_proba(widget.testResult.getList())}%",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("Здесь будет детальная информация о том, что значит эта цифра",
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("Также рекомендации с полезным контентом",
                  textAlign: TextAlign.center,
                ),
              ),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: new Text("На главную страницу",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),


      ),
    );
  }

  String predict_proba(List<double> X) {
    print("mlp");
    List<List<dynamic>> network = [X, null, null];
    mlp.layers.asMap().forEach(
            (i, v) => network[i + 1] = List<double>.filled(mlp.layers[i], 0.0));
    for (int i = 0; i < network.length - 1; i++) {
      for (int j = 0; j < network[i + 1].length; j++) {
        network[i + 1][j] = mlp.intercepts[i][j];
        network[i].asMap().forEach(
                (l, v) => network[i + 1][j] += network[i][l] * mlp.coefs[i][l][j]);
      }
      if ((i + 1) < (network.length - 1)) {
        network[i + 1] = _activation(network[i + 1]);
      }
    }
    network[network.length - 1] =
        _activation(network[network.length - 1], mlp.outActivation);

    print(network);
    print(network[network.length - 1]);

    if (network[network.length - 1].length == 1) {
      return (network[network.length - 1][0]*100).toStringAsFixed(2);
    }

    return mlp.classes[mathutils.argmax(network[network.length - 1])].toString();
  }

  List<double> relu(List<double> val) {
    val.asMap().forEach((i, v) => val[i] = max(0, val[i]));
    return val;
  }

  List<double> logistic(List<double> val) {
    val.asMap().forEach((i, v) => val[i] = 1.0 / (1.0 + exp(-val[i])));
    return val;
  }

  List<double> _activation(List<double> val, [String activationType]) {
    activationType ??= mlp.activation;
    if (activationType == "logistic") return logistic(val);
    if (activationType == "relu") return relu(val);
  }
}