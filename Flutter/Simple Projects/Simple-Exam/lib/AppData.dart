import 'QuestionClass.dart';

class AppData {
  int _questionNumber = 0;

  List<Question> questions = [
    Question(
      'Number of the Planets in the Universe is 8?',
      'Images/image-1.jpg',
      true,
    ),
    Question('Cats are carnivores', 'Images/image-2.jpg', true),
    Question(
      'China is present in the African continent',
      'Images/image-3.jpg',
      false,
    ),
    Question('The Earth is flat, not spherical.', 'Images/image-4.jpg', false),
    Question(
      'Humans can survive without eating meat.',
      'Images/image-5.jpg',
      true,
    ),
    Question(
      'The sun revolves around the earth and the earth revolves around the moon',
      'Images/image-6.jpg',
      false,
    ),
    Question('Animals don\'t feel pain', 'Images/image-7.jpg', false),
  ];

  void nextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return questions[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return questions[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return questions[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
