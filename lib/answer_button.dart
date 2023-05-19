import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.text, this.onTap, {super.key});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 67, 0, 121),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
