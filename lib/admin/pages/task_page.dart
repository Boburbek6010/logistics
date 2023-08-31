import 'package:f_exam/admin/firebase_controller.dart';
import 'package:f_exam/style/custom_scaffold.dart';
import 'package:f_exam/user/home/widgets/glass_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/item_model.dart';

class TaskPage extends StatefulWidget {
  static const id = "/task_page";
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final Future<List<ItemModel>> futureFiles;

  @override
  void initState() {
    futureFiles = FirebaseApi.listAll("/users/fl_exam1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Some error occurred"),
                  );
                } else {
                  final files = snapshot.data;
                  return GridView.builder(
                    padding: const EdgeInsets.all(30),
                    itemCount: files?.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400, mainAxisSpacing: 50, crossAxisSpacing: 50),
                    itemBuilder: (context, index) {
                      String? mainText = files![index].name;
                      List<String> parts = mainText.split('+');
                      String userId = parts[0];
                      String userGroup = parts[1];
                      String userName = parts[2];
                      String startedTime = parts[3];
                      String uploadedTime = parts[4];
                      String fileType = parts[4].substring(17, 20);
                      return Center(
                        child: GlassWidget(
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: 20,
                          blur: 5,
                          alignment: Alignment.center,
                          border: 1.5,
                          linearGradient: LinearGradient(
                            colors: [Colors.white.withOpacity(0.2), Colors.white12],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderGradient: LinearGradient(
                            colors: [const Color(0xFFffffff).withOpacity(0.5), Colors.white70],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${index+1}", style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Student ID:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        userId,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Student group:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        userGroup,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Student name:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          userName,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Started at:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        startedTime,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Finished at:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        uploadedTime.substring(0, uploadedTime.length-4),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "File type:",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        fileType,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 75,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      splashColor: Colors.white,
                                      onPressed: ()async{
                                        await FirebaseApi.download(files[index].ref);
                                      },
                                      icon: const Icon(CupertinoIcons.doc, size: 70,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
