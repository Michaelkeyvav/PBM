import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Jakarta adalah ibu kota', questionAnswer: true),
    Question(questionText: 'Michael emang jelek', questionAnswer: false),
    Question(questionText: 'Depok engga punya walikota', questionAnswer: true),
    Question(questionText: 'Indonesia adalah negara', questionAnswer: true),
    Question(questionText: '5 + 5 : 5 = 2', questionAnswer: true),
    Question(questionText: 'lift teknik bagus', questionAnswer: false),
    Question(questionText: 'joko widodo presiden ke 7 RI', questionAnswer: true),
    Question(questionText: 'mesir negara pertama yang mengakui indonesia merdeka', questionAnswer: true),
    Question(questionText: 'apakah kita butuh uang', questionAnswer: true),
    Question(questionText: 'ikan hidup didarat', questionAnswer: false),
    Question(questionText: 'alfamart dan indomart selalu berdekatan', questionAnswer:  true),
    Question(questionText: 'bendera indonesia warna merah putih', questionAnswer: true),
    Question(questionText: 'lambang negara indonesia musang', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 1;
  }
}