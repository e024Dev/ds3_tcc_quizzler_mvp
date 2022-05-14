class Answer {
  int id = 0;
  String answer = '';
  bool correct = false;

  Answer({required this.id, required this.answer, this.correct = false});

  @override
  String toString() {
    return 'Answer[id=$id, answer=$answer, correct=$correct]';
  }
}
