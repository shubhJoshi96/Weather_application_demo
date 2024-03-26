import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_update_application/Model/question_model.dart';
import 'colors.dart';

void main() {
  runApp(QuizScreen());
}

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questions = [
    QuestionModel('Q.1 Which Planet is the hottest in the Solar System?', {
      'Earth': false,
      'Venus': true,
      'Jupiter': false,
      'Saturn': false,
    }),
    QuestionModel('Q.2 Which Planet is the nearest to the earth?', {
      'Saturn': false,
      'Mercury': false,
      'Venus': true,
      'Jupiter': false,
    }),
    QuestionModel(
        'Q.3 Which Planet is the largest planet in the Solar System?', {
      'Earth': false,
      'Mercury': false,
      'Jupiter': true,
      'Saturn': false,
    }),
    QuestionModel('Q.4 Which Planet is the Closest to the Sun?', {
      'Earth': false,
      'Mercury': true,
      'Jupiter': false,
      'Saturn': false,
    }),
    QuestionModel(
        'Q.5 Which Planet is the Coldest and Smallest of all planets?', {
      'Earth': false,
      'Venus': false,
      'Jupiter': false,
      'pluto': true,
    }),
  ];

  var count = 0;
  int score = 0;
  bool btnPressed = false;
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('Quiz Screen'),
          ),
          body: count < questions.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 30.0,
                        child: Text(
                          'Question$count/${questions.length}',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          questions[count].question,
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                    for (var i = 0; i < questions[count].answer.length; i++)
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        margin: EdgeInsets.only(bottom: 12.0),
                        padding: EdgeInsets.all(12.0),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          fillColor: btnPressed
                              ? questions[count].answer.values.toList()[i]

                                  ? Colors.green
                                  : Colors.red
                              : AppColor.secondaryColor,
                          onPressed: answered
                              ? null
                              : () {
                            if (questions[count]
                                .answer
                                .values
                                .toList()[i]) {
                              setState(() {
                                score++;
                              });
                            }
                            setState(() {
                              btnPressed =true;
                              answered = true;
                            });
                          },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                questions[count].answer.keys.toList()[i],
                                style: TextStyle(fontSize: 20.0),
                              ),
                              answered
                                  ?
                              questions[count].answer.values.toList()[i] ?
                              Image.asset("images/yes.jpeg",width: 23,height: 23,)
                              : Image.asset("images/no.jpeg")
                                  :
                              Container()



                            ],
                          ),


                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            setState(() {
                              count = count + 1;
                              answered=btnPressed= false;
                              // score=score+1;
                            });
                          },
                          child: Text(
                            'Next Question',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          'Congratulations',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 30.0,
                          child: Text(
                            'Score = $score',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                            height: 40.0,
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              onPressed: () {
                                setState(() {
                                  score=count = 0;
                                });
                              },
                              child: Text(
                                'Restart the Quiz',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            )),
                      )
                    ],
                  ),
                )),
    );
  }
}
