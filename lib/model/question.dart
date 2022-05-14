import 'package:ds3_tcc_quizzler_mvp/model/answer.dart';

class Question {
  int id = 0;
  String question = '';
  List<Answer> anwers = [];

  Question({required this.id, required this.question, required this.anwers});
}
