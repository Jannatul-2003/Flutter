import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerTxt;
  final void Function() onTap;
  const AnswerButton({
    required this.answerTxt,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 21, 2, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answerTxt,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
