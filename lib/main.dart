import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/pages/admin_page.dart';
import 'package:f_exam/admin/pages/result_page.dart';
import 'package:f_exam/admin/pages/task_page.dart';
import 'package:f_exam/auth/pages/sign_in_page.dart';
import 'package:f_exam/admin/pages/interview_page.dart';
import 'package:f_exam/setup.dart';
import 'package:f_exam/auth/pages/auth_gate.dart';
import 'package:f_exam/user/home/pages/home_page.dart';

void main() {
  setup().then((value) {
    return runApp(LayoutBuilder(
      builder: (context, constrains) {
        if(constrains.maxWidth >= 1200&&constrains.maxHeight >=650) {
          return const _MyAppWeb();
        }else{
          return const _MyAppOther();
        }
      }
    ));
  });
}

class _MyAppWeb extends StatelessWidget {
  const _MyAppWeb();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'U Exam',
      home: kIsWeb ? const AdminPage() :const Scaffold(body: Center(child: Text("This app in only available for web"),),),
      routes: {
        AuthGate.id: (context) => const AuthGate(),
        SignInPage.id: (context) => const SignInPage(),
        AdminPage.id: (context) => const AdminPage(),
        HomePage.id: (context) => const HomePage(),
        InterviewPage.id: (context) => const InterviewPage(),
        TaskPage.id: (context) => const TaskPage(),
        ResultPage.id: (context) => const ResultPage(),
      },
    );
  }
}

class _MyAppOther extends StatelessWidget {
  const _MyAppOther();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'U Exam',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("App runs only in WEB", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 30),
              Text("Please make sure you have a screen larger than 1200", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ],
          ),
        ),
      )
    );
  }
}




