import 'package:f_exam/admin/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/model/user_model.dart';
import 'package:f_exam/admin/pages/result_page.dart';
import 'package:f_exam/services/util_service.dart';
import 'package:f_exam/style/custom_scaffold.dart';
import 'package:f_exam/user/home/widgets/glass_widget.dart';
import 'interview_page.dart';

class AdminPage extends StatefulWidget {
  static const id = "/admin_page";
  final CustomUser? customUser;

  const AdminPage({super.key, this.customUser});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {


  final List<Widget> _pages = [
    const InterviewPage(),
    const TaskPage(),
    const ResultPage(),
  ];

  final Map<String, String> _names = {
    "Let's interview": "You can interview students by asking questions related to their subject and grade them easily",
    "Check files": "You have a chance to and check whether files are uploaded and have them ready by students with started and uploaded time",
    "Results": "You will know the grades or marks of every students given by their teacher",
    "Be super ADMIN": "You judge your students as their teacher",
  };


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GridView.builder(
            padding: const EdgeInsets.all(50),
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 70,
                mainAxisSpacing: 50,
                crossAxisCount: 2,
                childAspectRatio: 16 / 9),
            itemCount: _names.length,
            itemBuilder: (BuildContext context, int index) {
              return MaterialButton(
                hoverColor: Colors.white.withOpacity(0.3),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 0,
                color: Colors.transparent,
                onPressed: () {
                  if(index == 3){
                    Utils.fireSnackBar("Be patient it will be available soon", context);
                  }else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]));
                  }
                },
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
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        Colors.white70
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _names.keys.toList()[index],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _names.values.toList()[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              );
            },
          ),
      ),
    );
  }
}


