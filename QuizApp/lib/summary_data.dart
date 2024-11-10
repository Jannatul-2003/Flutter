import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({super.key, required this.data});
  final List<Map<String, Object>> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...data.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIdentifier(
                        questionIndex: data['question_index'] as int,
                        isCorrect:
                            data['correct_answer'] == data['user_answer']),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data['question'] as String),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(156, 255, 255, 255),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 155, 189, 216),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 12.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}