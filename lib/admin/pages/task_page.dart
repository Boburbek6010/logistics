import 'package:f_exam/style/custom_scaffold.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  static const id = "/task_page";
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(),
      ),
    );
  }
}
