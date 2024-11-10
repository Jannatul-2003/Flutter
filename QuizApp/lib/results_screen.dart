import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.quizRestart, required this.choosenAnswers});
  final void Function() quizRestart;
  final List<String> choosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questionsAnswered[i].questionText,
        'correct_answer': questionsAnswered[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalQuestions = questionsAnswered.length;
    final correctQuestions = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $correctQuestions question(s) correctly out of $totalQuestions question(s)!',
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(190, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          SummaryData(data: summary),
          TextButton.icon(
              onPressed: quizRestart,
              icon: const Icon(Icons.refresh_outlined),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}