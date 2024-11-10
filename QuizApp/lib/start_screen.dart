import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              fontSize: 25,
              color: const Color.fromARGB(146, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
          onPressed: 
            startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
      
            ),
            icon: const Icon(Icons.play_arrow),
            label:const Text(
              "Start Quiz",
            ),
          ),
        ],
      ),
    );
  }
}
