import 'package:flutter/material.dart';
import 'package:quizz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text('QUIZ'), // Ubah judul app bar sesuai keinginan Anda
          backgroundColor: Colors.red, // Warna latar belakang app bar
          // actions: <Widget>[ // Untuk menambahkan tombol di sebelah kanan app bar
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {
          //       // Action ketika tombol di tekan
          //     },
          //   ),
          // ],
        ),
        body: const SafeArea(
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

  List<Icon> scoreKeeper = [];


  int numCorrect = 0;
  int numIncorrect = 1;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      //TODO: Step 4 - menggunakan IF/ELSE untuk cek akhir quiz
      //jika ia, maka ke line berikuntya
      if (quizBrain.isFinished() == true ) {
        //TODO Step 4 Part A - menampilkan alert menggunakan rFlutter_alert
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the Quiz\n'
          'Correct Answers: $numCorrect\n'
          'Incorrect Answers: $numIncorrect\n'
          'Total Questions: ${quizBrain.getTotalQuestions()}',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      }

      //TODO: Step 6 - if not reached the end, ELSE do the answer checking
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.blue,
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.yellow,
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    });
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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                foregroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
