import 'dart:ui';
import 'package:f_exam/style/custom_scaffold.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/model/interview_user.dart';
import '../../services/rtdb_service.dart';

class ResultPage extends StatefulWidget {
  static const id = "/result_page_";

  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  bool isLoading = false;
  Iterable<DataSnapshot> items = [];
  List<InterviewUser> users = [];


  List<InterviewUser> convertDataSnapshotsToUsers(Iterable<DataSnapshot> snapshots) {
    List<InterviewUser> users = [];

    for (var snapshot in snapshots) {
      var snapshotValue = snapshot.value as Map<String, dynamic>?;

      if (snapshotValue != null) {
        users.add(InterviewUser.fromJson(snapshotValue));
      }
    }

    return users;
  }



  @override
  void initState() {
    super.initState();
    _getAllPost();
  }

  Future<void> _getAllPost() async {
    items = await RTDBService.loadPosts();
    users = convertDataSnapshotsToUsers(items);
    users.sort((a, b) {
      if (a.qT.startsWith('A')) {
        if (b.qT.startsWith('A')) {
          return a.qT.compareTo(b.qT); // Sort alphabetically within 'A'
        } else {
          return -1; // 'A' should come before 'B' and 'C'
        }
      } else if (a.qT.startsWith('B')) {
        if (b.qT.startsWith('A')) {
          return 1; // 'B' should come after 'A'
        } else if (b.qT.startsWith('B')) {
          return a.qT.compareTo(b.qT); // Sort alphabetically within 'B'
        } else {
          return -1; // 'B' should come before 'C'
        }
      } else {
        if (b.qT.startsWith('C')) {
          return a.qT.compareTo(b.qT);
        } else {
          return 1;
        }
      }
    });
    isLoading = true;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: isLoading ?GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              maxCrossAxisExtent: 300,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              double iPercentage = 0;
              int q1 = int.tryParse(users[index].q1) ?? 0;
              int q2 = int.tryParse(users[index].q2) ?? 0;
              int q3 = int.tryParse(users[index].q3) ?? 0;
              int q4 = int.tryParse(users[index].q4) ?? 0;
              int q5 = int.tryParse(users[index].q5) ?? 0;
              iPercentage = (q1 + q2 + q3 + q4 + q5) * 100 / 50;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: FlipCard(
                  front: ClipRRect(
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
                              users[index].qT.startsWith("A") ?Colors.blue :users[index].qT.startsWith("B") ?Colors.yellow:Colors.red,
                              Colors.white.withOpacity(0.3)
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text("${index+1}. ${users[index].name}", style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  overflow: TextOverflow.fade,
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("\t\t\t\tInterview\n(max=40 ball)", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700
                            ),),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Interview = "),
                              Text("$iPercentage%"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Interview = "),
                              Text("${iPercentage*40 ~/ 100} ball"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ):const Center(
            child: CircularProgressIndicator(),
          ),
      ),
    );
  }
}