import 'package:flutter/material.dart';

class Utils {
  static String getFirstLetters(String fullName) => fullName.isNotEmpty
      ? fullName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join() : '';

  // FireSnackBar
  static void fireSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(msg, style: const TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.center,),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

}