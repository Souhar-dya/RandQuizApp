import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/question.dart';

class Questions extends StatefulWidget {
  const Questions({required this.onchosen, super.key});
  final void Function(String answer) onchosen;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentquestionindex = 0;
  void answerQ(String selectanswer) {
    widget.onchosen(selectanswer);
    setState(() {
      currentquestionindex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentquestionindex];
    return Container(
      margin: const EdgeInsets.all(25),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.shuffledLists().map((e) {
              return Answer(e, () {
                answerQ(e);
              });
            }),
          ],
        ),
      ),
    );
  }
}
