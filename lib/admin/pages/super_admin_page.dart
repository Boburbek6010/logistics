import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_exam/style/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SuperAdminPage extends StatefulWidget {
  static const id = "/super_admin_page";
  const SuperAdminPage({super.key});

  @override
  State<SuperAdminPage> createState() => _SuperAdminPageState();
}

class _SuperAdminPageState extends State<SuperAdminPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController markController = TextEditingController();
  bool isLoading = false;



  final CollectionReference user = FirebaseFirestore.instance.collection("students_result");



  Future<void> sendPaper([DocumentSnapshot? documentSnapshot]) async {
    final String name = nameController.text.trim();
    final String mark = markController.text.trim();
    await user.add({"name": name, "task_result": mark, "time":"???"});
    nameController.clear();
    markController.clear();
    setState(() {});
    isLoading = false;
  }




  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            isLoading
                ?const Center(child: CircularProgressIndicator(),):Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 50),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                    decoration: const InputDecoration(
                        labelText: "Name of the student",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 500),
                  child: TextField(
                    controller: markController,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                    decoration: const InputDecoration(
                        labelText: "Enter the mark",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                const SizedBox(height: 50),
                MaterialButton(
                  minWidth: 400,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      )),
                  onPressed: ()async{
                    isLoading = true;
                    setState(() {

                    });
                    await sendPaper();
                  },
                  color: Colors.white.withOpacity(0.4),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
