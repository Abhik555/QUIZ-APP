import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.answers, this.restart, {super.key});

  final List<String> answers;
  final void Function() restart;

  List<Map<String, Object>> getItems() {
    final List<Map<String, Object>> items = [];

    for (int i = 0; i < answers.length; i++) {
      items.add({
        questions[i].Question: [answers[i], questions[i].Answers[0]]
      });
    }

    return items;
  }

  List getCorrectNumber(List<Map<String, Object>> input) {
    final metrix = [];
    var c = 0;

    for (var x in input) {
      x.values.toList().forEach((e) {
        var l = e as List;
        if (l[0] == l[1]) {
          c++;
        }
      });
    }

    metrix.add(c);
    metrix.add(input.length);

    return metrix;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summary = getItems();
    List corrects = getCorrectNumber(summary);
    var c = corrects[0];
    var t = corrects[1];

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 88, 27, 194)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You got $c correct out of $t questions',
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                //ListView.builder(itemBuilder: ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: restart,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Restart Quiz")),
              ],
            ),
          )),
    );
  }
}
