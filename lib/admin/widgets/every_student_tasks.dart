import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EveryStudentTasks extends StatelessWidget {
  final VoidCallback onPressed;
  final int index;
  final String userId;
  final String group;
  final String name;
  final String startedTime;
  final String uploadedTime;
  final String fileType;
  const EveryStudentTasks({super.key, required this.onPressed, required this.index, required this.userId, required this.group, required this.name, required this.startedTime, required this.uploadedTime, required this.fileType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 23, sigmaY: 23),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 5 * 0.2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white12
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.5),
                style: BorderStyle.solid,
                // gradient: borderGradient,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${index+1}", style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Colors.white
                  ),),
                  Row(
                    children: [
                      const Text("User ID: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$userId"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("User Group: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$group"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("User Name: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$name"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Started at: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$startedTime"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Uploaded at: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$uploadedTime"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("File type: ", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      Text("$fileType"),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15),
                      color: Colors.white,
                    ),
                    height: 90,
                    width: 80,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15),
                      ),
                      onPressed: onPressed,
                      child: const Icon(
                        CupertinoIcons.doc,
                        color: Colors.black,
                        size: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
