import 'package:quizzler/questions.dart';

class QuizzBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questionText: 'The population of the Earth is over 8 billion people ?',
        questionAnswer: true),
    Question(
        questionText:
            'The Earth is the only planet in our solar system with liquid water on its surface ?',
        questionAnswer: false),
    Question(
        questionText:
            'The Mona Lisa is a famous painting by Leonardo da Vinci ?',
        questionAnswer: true),
    Question(questionText: 'A dog has 20 toes ?', questionAnswer: false),
    Question(
        questionText:
            'Oxygen is the most abundant element in Earth\'s atmosphere ?',
        questionAnswer: true),
    Question(
        questionText: 'The capital of France is London ?',
        questionAnswer: false),
    Question(
        questionText: 'Water boils at 100 degrees Celsius at sea level ?',
        questionAnswer: true),
    Question(
        questionText: 'All triangles have three equal angles ?',
        questionAnswer: false),
    Question(
        questionText:
            'The Great Wall of China is the longest man-made structure in the world ?',
        questionAnswer: true),
    Question(questionText: 'The sun is a planet', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
