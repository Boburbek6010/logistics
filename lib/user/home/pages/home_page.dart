import 'dart:async';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:f_exam/services/util_service.dart';
import 'package:f_exam/style/custom_scaffold.dart';
import 'package:f_exam/user/home/widgets/question_paper.dart';

import '../widgets/clock_countdown.dart';
import '../widgets/glass_widget.dart';
import '../widgets/instruction_widget.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  final String? regName;
  final String? regTime;
  final String? regEmail;

  const HomePage({super.key, this.regName, this.regTime, this.regEmail});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  bool done = false;
  bool hasErrorId = false;
  bool hasErrorName = false;
  bool hasErrorGroup = false;
  bool questionStarted = false;
  String? time;
  String? startTime;

  Future<void> getFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );
    if (result != null) {
      fileName = result!.files.first.name;
    }
    setState(() {});
  }

  Future<void> upload() async {
    if (result != null) {
      isLoading = true;
      setState(() {});
      Uint8List fileBytes = result!.files.first.bytes!;
      time = DateTime.now().toString().substring(0, 16);
      await FirebaseStorage.instance.ref('/users/fl_exam1/${idController.text.trim().toString()}+${groupController.text.trim().toString()}+${nameController.text.trim().toString()}+$startTime+$time.zip').putData(fileBytes);
    }
    isLoading = false;
    done = true;
    setState(() {});
    Future.delayed(const Duration(seconds: 2)).then((value) {
      done = false;
      setState(() {});
    });
  }

  Future<void> _finishing() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Center(child: Text('Thank you!\nYour request will be accepted\nNow you can exit the app')),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 100,
          leading: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              widget.regName ?? "No name",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: questionStarted
              ? const SizedBox.shrink()
              : MaterialButton(
                  minWidth: 400,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      )),
                  onPressed: () {
                    questionStarted = true;
                    startTime = DateTime.now().toString().substring(0, 16);
                    setState(() {});
                  },
                  color: Colors.white.withOpacity(0.4),
                  child: const Text(
                    "Start a survey",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                questionStarted
                    ? flipCountdown(const ColorScheme.dark(), () {
                        setState(() {
                          _finishing();
                        });
                      })
                    : const SizedBox.shrink(),
                const Spacer(),
                const Spacer(),
                questionStarted
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlassWidget(
                            width: 600,
                            height: 500,
                            borderRadius: 20,
                            blur: 5,
                            alignment: Alignment.center,
                            border: 1.5,
                            linearGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.white12
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
                                    padding: const EdgeInsets.symmetric(horizontal: 50),
                                    child: TextField(
                                      onChanged: (value) {
                                        if (idController.text.trim() == "") {
                                          hasErrorId = true;
                                          setState(() {});
                                        } else {
                                          hasErrorId = false;
                                          setState(() {});
                                        }
                                      },
                                      controller: idController,
                                      keyboardType: TextInputType.number,
                                      autocorrect: true,
                                      style: const TextStyle(fontWeight: FontWeight.w700),
                                      decoration: InputDecoration(
                                          errorText: hasErrorId ? "Enter your ID" : null,
                                          errorBorder: hasErrorId
                                              ? const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            borderSide: BorderSide(color: Colors.red),
                                          )
                                              : null,
                                          labelText: "Your ID",
                                          labelStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: TextField(
                                      onChanged: (value) {
                                        if (groupController.text.trim() == "") {
                                          hasErrorGroup = true;
                                          setState(() {});
                                        } else {
                                          hasErrorGroup = false;
                                          setState(() {});
                                        }
                                      },
                                      controller: groupController,
                                      keyboardType: TextInputType.number,
                                      autocorrect: true,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                      decoration: InputDecoration(
                                          errorText: hasErrorGroup
                                              ? "Enter your Group Number"
                                              : null,
                                          errorBorder: hasErrorGroup
                                              ? const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            borderSide: BorderSide(
                                                color: Colors.red),
                                          )
                                              : null,
                                          labelText: "Your Group",
                                          labelStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.length < 3) {
                                          hasErrorName = true;
                                          setState(() {});
                                        } else {
                                          hasErrorName = false;
                                          setState(() {});
                                        }
                                      },
                                      controller: nameController,
                                      keyboardType: TextInputType.number,
                                      autocorrect: true,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                      decoration: InputDecoration(
                                          errorText: hasErrorName
                                              ? "Name should be more than 3 words"
                                              : null,
                                          errorBorder: hasErrorName
                                              ? const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            borderSide: BorderSide(
                                                color: Colors.red),
                                          )
                                              : null,
                                          labelText: "Your Name",
                                          labelStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10)),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.3))
                                    ),
                                    onPressed: () async {
                                      await getFile();
                                      setState(() {});
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          fileName ?? "",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Icon(
                                          Icons.upload_file,
                                          size: 100,
                                          color: Colors.white,
                                        ),
                                        const Text(
                                          "UPLOAD",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GlassWidget(
                            width: 700,
                            height: 500,
                            borderRadius: 20,
                            blur: 5,
                            alignment: Alignment.center,
                            border: 1.5,
                            linearGradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.2),
                                Colors.white12
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
                            child: const QuestionPaper(),
                          ),
                        ],
                      )
                    : const InstructionWidget(),
                const Spacer(),
                const Spacer(),
              ],
            ),
            isLoading
                ? Center(
                    child: Lottie.asset("assets/lotties/uploading.json"),
                  )
                : done
                    ? Center(child: Lottie.asset("assets/lotties/done.json"))
                    : const SizedBox.shrink(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            questionStarted
                ? MaterialButton(
                    minWidth: 400,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        )),
                    onPressed: () async {
                      if (idController.text.trim() == "" &&
                          groupController.text.trim() != "" &&
                          nameController.text.trim() != "") {
                        print(1);
                        hasErrorId = true;
                        setState(() {});
                      } else if (groupController.text.trim() == "" &&
                          idController.text.trim() != "" &&
                          nameController.text.trim() != "") {
                        hasErrorGroup = true;
                        print(2);
                        setState(() {});
                      } else if (idController.text.trim() != "" &&
                          groupController.text.trim() != "" &&
                          nameController.text.trim() == "") {
                        print(3);
                        hasErrorName = true;
                        setState(() {});
                      } else if (idController.text.trim() == "" &&
                          nameController.text.trim() == "" &&
                          groupController.text.trim() == "") {
                        hasErrorId = true;
                        print(4);
                        hasErrorGroup = true;
                        hasErrorName = true;
                        setState(() {});
                      } else if (idController.text.trim() == "" &&
                          groupController.text.trim() == "" &&
                          nameController.text.trim() != "") {
                        hasErrorGroup = true;
                        print(5);
                        hasErrorId = true;
                        setState(() {});
                      } else if (idController.text.trim() == "" &&
                          groupController.text.trim() != "" &&
                          nameController.text.trim() == "") {
                        hasErrorName = true;
                        hasErrorId = true;
                        print(6);
                        setState(() {});
                      } else if (idController.text.trim() != "" &&
                          groupController.text.trim() == "" &&
                          nameController.text.trim() == "") {
                        hasErrorName = true;
                        hasErrorGroup = true;
                        print(7);
                        setState(() {});
                      }
                      print("File Name: $fileName");
                      if (!hasErrorId &&
                          !hasErrorGroup &&
                          !hasErrorName &&
                          fileName != null) {
                        await upload();
                        fileName = "";
                        idController.clear();
                        nameController.clear();
                        groupController.clear();
                        _finishing();
                        Future.delayed(Duration(seconds: 5), () {
                          window.close();
                        });
                      } else if (!hasErrorId &&
                          !hasErrorGroup &&
                          !hasErrorName &&
                          fileName == null) {
                        Utils.fireSnackBar(
                            "Please UPLOAD your project first", context);
                        setState(() {});
                      }
                    },
                    color: Colors.white.withOpacity(0.4),
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
