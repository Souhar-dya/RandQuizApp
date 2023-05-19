import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/display_result_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.answers,
    required this.onRestart,
  });
  final void Function() onRestart;
  final List<String> answers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    var numTotalQuestion = questions.length;
    final numCorrectList = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    });
    final numCorrectQues = numCorrectList.length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answerd $numCorrectQues out of $numTotalQuestion questions correctly",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              DisplayResult(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: () {
                    onRestart();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Restart Quiz!"))
            ],
          ),
        ));
  }
}
