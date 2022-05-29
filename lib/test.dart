import 'package:flutter/material.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new DepressionTest();

class DepressionTest{


  var questions = [
    "Ваш возраст: ",
    "Неделя беременности: ",
    "Были ли у вас проблемы со здоровьем раньше? ",
    "Была ли беременность запланированной? ",
    "Вы трудоустроены? ",
    "Ваш уровень образования: ",
    "Ваш уровень прибыли: ",
    "Семейный статус: ",
    "Были ли у вас ментальные заболевания раньше? ",
    "Какой формат контента вы предпочитаете? "
  ];


  var choices = [
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"],
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"],
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"]
  ];

}

class Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TestState();
  }
}

class TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                    ],
                  ),
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),


                  ],
                ),

                //image
                new Padding(padding: EdgeInsets.all(50.0)),

                new Image.asset(
                  "images/robot.png",
                  height: 250,
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child:  new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text("Quit",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),)
                    )
                ),




              ],
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int? score;
  Summary({Key? key, this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Final Score: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Reset Quiz",
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


}