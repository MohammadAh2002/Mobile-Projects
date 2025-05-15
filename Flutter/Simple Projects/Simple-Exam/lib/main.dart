import 'package:flutter/material.dart';
import 'AppData.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppData appData = AppData();

void main() {
  runApp(Exam());
}

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],

        appBar: AppBar(backgroundColor: Colors.grey, title: Text('Exam')),

        body: Padding(padding: const EdgeInsets.all(20), child: ExamPage()),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appData.getQuestionAnswer();

    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;

        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(Icons.thumb_up, color: Colors.green),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }

      if (appData.isFinished() == true) {
        Alert(
          context: context,
          title: "Exam Finished",
          desc: "You got $rightAnswers out of 7 questions correct.",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: Text(
                "PLay Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ).show();

        appData.reset();

        answerResult = [];

        rightAnswers = 0;
      } else {
        appData.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(children: answerResult),

        Expanded(
          flex: 5,

          child: Column(
            children: [
              Image.asset(appData.getQuestionImage()),
              SizedBox(height: 20),
              Text(
                appData.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
