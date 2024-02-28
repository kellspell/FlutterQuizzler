import 'package:flutter/material.dart';
import 'package:quizzler/quizzBrain.dart';

QuizzBrain quizzBrain = QuizzBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
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
  const QuizPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
    const Icon(Icons.check, color: Colors.green),
    const Icon(Icons.close, color: Colors.red),
  ];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizzBrain.getQuestionAnswer();
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }

      quizzBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Expanded(
          child: Text(
            quizzBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: TextField.noMaxLength,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  // questions(),
                  'True',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        Expanded(
          flex: TextField.noMaxLength,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'False',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        const SizedBox(height: 20.0),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
