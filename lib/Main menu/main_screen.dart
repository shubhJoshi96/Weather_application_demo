import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_update_application/Screen/quiz_screen.dart';


void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset("images/quiz_icon2.png"),
              Text(
                'Quiz',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizScreen(),
                            ));
                      },
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
