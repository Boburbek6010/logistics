import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/auth/pages/sign_in_page.dart';
import 'package:f_exam/user/home/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  static const id = "/auth_page";
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data?.displayName != null){
          return HomePage(
            regName: snapshot.data!.displayName!,
              regEmail: snapshot.data!.email!,
              regTime: snapshot.data!.metadata.creationTime!.toString(),
          );
        }else{
          return const SignInPage();
        }
      },
    );
  }
}