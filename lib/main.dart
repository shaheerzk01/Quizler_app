import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz_brain quizBrain = Quiz_brain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  void checkedAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
            context: context,
            title: 'FINISHED',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          quizBrain.reset();
          scorekeeper = [];
        } else {
          if (userPickedAnswer == correctAnswer) {
            scorekeeper.add(
              Icon(Icons.check, color: Colors.green),
            );
          } else {
            scorekeeper.add(
              Icon(Icons.close, color: Colors.red),
            );
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkedAnswer(true);
                //This will mark as true
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkedAnswer(false);
                //This will mark as false
              },
            ),
          ),
        ),
        //TODO: Add a row here as your score keeper,
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
