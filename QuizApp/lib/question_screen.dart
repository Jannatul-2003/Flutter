import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;
  final void Function() endQuiz;
  const QuestionScreen({super.key,required this.onSelectedAnswer, required this.endQuiz});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    questionsAnswered.add(questions[currentQuestionIndex]);
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      
    });
  }

  @override 
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 152, 118, 228),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerTxt: answer,
                  onTap:() => answerQuestion(answer),
                );
              },
            ),
          Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton.icon(
              onPressed: widget.endQuiz,
              icon: const Icon(Icons.stop_circle_rounded),
              label: const Text(
                'End Quiz',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
        )
      ],
        ),
      ),
    );
  }
}
