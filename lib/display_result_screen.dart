import 'package:flutter/material.dart';
import 'package:quizapp/style_resultscreen.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return SummaryItem(
              itemData: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
