// ignore_for_file: non_constant_identifier_names

class QuizQuestion {
  final String Question;
  final List<String> Answers;

  const QuizQuestion(this.Question, this.Answers);

  List<String> GetShuffuledList() {
    final out = List.of(Answers);
    out.shuffle();
    return out;
  }
}
