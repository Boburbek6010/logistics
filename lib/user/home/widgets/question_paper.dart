import 'package:flutter/material.dart';
import 'package:f_exam/data/questions.dart';

class QuestionPaper extends StatelessWidget {
  const QuestionPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index){
          return Text("${index+1}.${questions[index]}", style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),);
        },
      )
    );
  }
}
