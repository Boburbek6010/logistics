import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/model/interview_user.dart';
import 'package:f_exam/user/home/widgets/every_button.dart';

import '../../services/auth_service.dart';
import '../../services/db_service.dart';
import '../../services/rtdb_service.dart';
import '../../services/util_service.dart';
import '../../user/home/widgets/glass_widget.dart';

class InterviewPage extends StatefulWidget {
  static const id = "/interview_page";
  const InterviewPage({super.key});

  @override
  State<InterviewPage> createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controllerType = TextEditingController();
  bool isTrue = false;



  void _addPost() async {
    String name = nameController.text.trim();
    String q1 = controller1.text.trim();
    String q2 = controller2.text.trim();
    String q3 = controller3.text.trim();
    String q4 = controller4.text.trim();
    String q5 = controller5.text.trim();
    String qT = controllerType.text.trim();

    if (name.isEmpty ||
        q1.isEmpty ||
        q2.isEmpty ||
        q3.isEmpty ||
        q4.isEmpty ||
        q5.isEmpty) {
      Utils.fireSnackBar("Please fill all fields", context);
      return;
    }
    setState(() {});

    InterviewUser post = InterviewUser(name, q1, q2, q3, q4, q5, qT);

    await RTDBService.storePost(post).then((value) {
      Navigator.of(context).pop();
    });
    setState(() {});
  }

  late DatabaseReference refDb;

  @override
  void initState() {
    refDb = FirebaseDatabase.instance.ref().child("user");
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/just.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GlassWidget(
            width: 600,
            height: 500,
            borderRadius: 20,
            blur: 5,
            alignment: Alignment.center,
            border: 1.5,
            linearGradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.green
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                Colors.white70
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                        labelText: "Student name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(
                            horizontal: 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controller1,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Question 1",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                              ),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controller2,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Question 2",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controller3,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Question 3",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controller4,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Question 4",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controller5,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Question 5",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50),
                    child: TextField(
                      controller: controllerType,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700),
                      decoration: const InputDecoration(
                          labelText: "Student ID",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12))),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 10)),
                    ),
                  ),

                  EveryButton(
                      name: "Submit",
                      onPressed: (){
                        Map<String, dynamic> map = {
                          "name":nameController.text.trim(),
                          "q1":controller1.text.trim(),
                          "q2":controller2.text.trim(),
                          "q3":controller3.text.trim(),
                          "q4":controller4.text.trim(),
                          "q5":controller5.text.trim(),
                          "qT":controllerType.text.trim()
                        };
                        refDb.push().set(map);
                        isTrue = true;
                        nameController.clear();
                        controllerType.clear();
                        controller1.clear();
                        controller2.clear();
                        controller3.clear();
                        controller4.clear();
                        controller5.clear();
                        Utils.fireSnackBar("Saved", context);
                        setState(() {});
                      },
                      color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
