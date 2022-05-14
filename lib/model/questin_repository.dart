import 'package:ds3_tcc_quizzler_mvp/model/answer.dart';
import 'package:ds3_tcc_quizzler_mvp/model/question.dart';

class QuestionRepository {
  int _questionNumber = 0;

  final _questionBankPortuguese = [
    Question(
      id: 1,
      question:
          'Quais os nomes que damos as letras que formam a língua portuguesa?',
      anwers: [
        Answer(id: 1, answer: 'Sons'),
        Answer(id: 2, answer: 'Balbucia'),
        Answer(id: 3, answer: 'Ronco'),
        Answer(id: 4, answer: 'Barulho'),
        Answer(id: 5, answer: 'Fonemas', correct: true)
      ],
    ),
    Question(
      id: 2,
      question: 'Quantas letras formam o alfabeto da língua portuguesa?',
      anwers: [
        Answer(id: 6, answer: '32'),
        Answer(id: 7, answer: '26', correct: true),
        Answer(id: 8, answer: '18'),
        Answer(id: 9, answer: '42'),
        Answer(id: 10, answer: '37')
      ],
    ),
    Question(
      id: 3,
      question: 'Quantas vogais possui o alfabeto da língua portuguesa?',
      anwers: [
        Answer(id: 11, answer: '6'),
        Answer(id: 12, answer: '8'),
        Answer(id: 13, answer: '5', correct: true),
        Answer(id: 14, answer: '4'),
        Answer(id: 15, answer: '3')
      ],
    ),
    Question(
      id: 4,
      question: 'Quais são as vogais, na ordem correta, do alfabeto português?',
      anwers: [
        Answer(id: 16, answer: 'a, b, c, d, e'),
        Answer(id: 17, answer: 'b, c, v, u, o'),
        Answer(id: 18, answer: 'e, d, c, o, i'),
        Answer(id: 19, answer: 'a, e, i, o, u', correct: true),
        Answer(id: 20, answer: 'i, o, d, c, v')
      ],
    ),
    Question(
      id: 5,
      question:
          'Quais são as consoantes, na ordem correta, do alfabeto português? ',
      anwers: [
        Answer(
            id: 21,
            answer:
                'g, f, t, r, s, x, v, y, z, b, c, h, m, n, o, p, q, l, w, k, d.'),
        Answer(
            id: 22,
            answer:
                ' c, h, m, n, o, p, q, l, w, k, d, g, f, r, s, x, v, y, z, g. '),
        Answer(
            id: 23,
            answer:
                'b, c, d, f, g, h, j, k, l, m, n, p, q, r, s, t, v, w, x, y, z.',
            correct: true),
        Answer(
            id: 24,
            answer:
                'm, n, o, p, q, l, w, k, d, g, f, t, r, s, x, v, y, z, b, c, h.'),
        Answer(
            id: 25,
            answer:
                'p, q, l, w, k, d, g, f, t, r, s, x, v, y, z, b, c, h, m, n, o.')
      ],
    ),
  ];

  getQuestionNumber() {
    return _questionNumber;
  }

  nextQuestion() {
    if (_questionNumber < _questionBankPortuguese.length - 1) {
      _questionNumber++;
    }
  }

  Question getQuestion() {
    return _questionBankPortuguese[_questionNumber];
  }

  getQuestionText() {
    return _questionBankPortuguese[_questionNumber].question;
  }

  List<Answer> getAnswers() {
    return _questionBankPortuguese[_questionNumber].anwers;
  }

  Answer? getCorrectAnswer() {
    return _questionBankPortuguese[_questionNumber]
        .anwers
        .firstWhere((item) => item.correct == true);
  }

  reset() {
    _questionNumber = 0;
  }

  isFinished() {
    if (_questionNumber > _questionBankPortuguese.length - 1) {
      return true;
    }

    return false;
  }

  List<Question> getAllPortuguese() {
    return _questionBankPortuguese;
  }
}
