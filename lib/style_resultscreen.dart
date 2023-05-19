import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/style_questionno.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, Key? key}) : super(key: key);

  final Map<String, Object?> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    final String question = itemData['question'] as String? ?? '';
    final String userAnswer = itemData['user_answer'] as String? ?? '';
    final String correctAnswer = itemData['correct_answer'] as String? ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          question: itemData,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                userAnswer,
                style:
                    const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              Text(
                correctAnswer,
                style:
                    const TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
