import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/model/interview_user.dart';
import '../../services/rtdb_service.dart';

class ResultPage extends StatefulWidget {
  static const id = "/result_page";

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

  void _getAllPost() async {
    items = await RTDBService.loadPosts();
    users = convertDataSnapshotsToUsers(items);
    isLoading = true;
    setState(() {});
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img3.png"),
            ),
          ),
          child: isLoading ?GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              maxCrossAxisExtent: 400,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
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
                                Text("$index. ${users[index].name}", style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                ),),
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
                                onPressed: () async {

                                },
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
            },
          ):const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}