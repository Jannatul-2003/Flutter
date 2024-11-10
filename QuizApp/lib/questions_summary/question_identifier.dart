import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrect});
  final int questionIndex;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
          height: 30,
          width: 30,
          padding: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: (isCorrect)
                ? const Color.fromARGB(255, 58, 143, 214)
                : const Color.fromARGB(255, 218, 37, 196),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            (questionIndex + 1).toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}