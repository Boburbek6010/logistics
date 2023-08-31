import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f_exam/admin/model/user_model.dart';
import 'package:f_exam/setup.dart';
import 'package:f_exam/user/home/pages/home_page.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/util_service.dart';
import '../../../admin/pages/admin_page.dart';
import '../widgets/register_main_card.dart';
import '../widgets/sign_main_card.dart';

class SignInPage extends StatefulWidget {
  static const id = "/sign_page";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {



  final TextEditingController rNameController = TextEditingController();
  final TextEditingController rEmailController = TextEditingController();
  final TextEditingController rPasswordController = TextEditingController();

  bool isLoading = false;
  bool isPressed = false;
  bool passed = false;
  // String? beginTime;

  void disposeAll() {
    log("Disposed");
    rNameController.clear();
    rEmailController.clear();
    rPasswordController.clear();
    isLoading = false;
    isPressed = false;
    passed = false;
  }

  void _checkNewUser(User? user, BuildContext context) async {
    log("wwwwwwww: ${user?.displayName.toString() ?? "nulllll"}");
    if (user != null) {
      isLoading = false;
      passed = true;
    } else {
      Utils.fireSnackBar("Check your data and try again", context);
      isLoading = true;
    }
    
  }

  void _catchError(Object error) {

  }

  void registerNewUser(BuildContext context) {
    isLoading = false;
    String name = rNameController.text.trim();
    String email = rEmailController.text.trim();
    String password = rPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Utils.fireSnackBar("Fill all gaps first", context);
      return;
    }else{
      AuthService.signUpUser(context, name, email, password).then((user) => _checkNewUser(user, context)).catchError(_catchError).then((value) {
        if (passed) {
          Utils.fireSnackBar("Successfully registered", context);
          _controller.animateToPage(0, duration: const Duration(seconds: 2), curve: Curves.bounceOut);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
          disposeAll();
          Utils.fireSnackBar("Now, you can Sign In ", context);
          setState(() {});
          isPressed = false;
          // beginTime = "Sana:${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\nSoat:${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
        }
      });
      setState(() {});
    }
  }





  ///===================================//////===================================///




  final TextEditingController emailControllerForLogin = TextEditingController();
  final TextEditingController passwordControllerForLogin = TextEditingController();
  final TextEditingController adminController = TextEditingController();







  void login(BuildContext context){
    String email = emailControllerForLogin.text.trim();
    String password = passwordControllerForLogin.text.trim();
    if(email.isEmpty || password.isEmpty){
      Utils.fireSnackBar("Fill all gaps first", context);
      return;
    }
    AuthService.signInUser(context, email, password).then((user) => _checkUserForLogin(user, context)).catchError(_catchErrorForLogin);
    
  }

  bool loginPassed = false;

  void _checkUserForLogin(User? user, BuildContext context)async{
    if(user != null){
      loginPassed = true;
      emailControllerForLogin.clear();
      passwordControllerForLogin.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(
        regName: rNameController.text.trim(),
      ),
      ));
      Utils.fireSnackBar("Logged In", context);

    }else{
      Utils.fireSnackBar("Check your data and try again", context);
    }
    
  }

  void _catchErrorForLogin(Object error){
    
  }



  final PageController _controller = PageController();



  ///===================================//////===================================///




  Future<void> _adminCheck() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Admin Panelga Xush Kelibsiz')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Center(child: Text('Iltimos password ni kiring')),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: adminController,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    obscureText: true,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                    decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                if (adminController.text.trim().toString() == adminPassword) {
                  setState(() {});
                  adminController.clear();
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminPage(),
                    ),
                  );
                } else {
                  setState(() {});
                  adminController.clear();
                  Utils.fireSnackBar("Xato Password", context);
                }
              },
            ),
          ],
        );
      },
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const SizedBox(width: 20),
          MaterialButton(
            shape: const CircleBorder(),
            onPressed: () {
              _adminCheck();
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.admin_panel_settings,
                  size: 35,
                  color: Colors.white,
                ),
                Text("Admin",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/login_back.png"),
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                SignMainCard(
                  loginPressed: () {
                    if(emailControllerForLogin.text.trim().toString() == adminLogin && passwordControllerForLogin.text.trim().toString() == adminPassword){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminPage()));
                    }else{
                      login(context);
                      log("email: ${emailControllerForLogin.text}  \npassword: ${passwordControllerForLogin.text}");
                    }
                  },
                  signUpPressed: () {
                    _controller.animateToPage(1, duration: const Duration(seconds: 2), curve: Curves.bounceOut);
                    emailControllerForLogin.clear();
                    passwordControllerForLogin.clear();
                  },
                  emailController: emailControllerForLogin,
                  passwordController: passwordControllerForLogin,
                  forgotPasswordPressed: () {},
                ),
                RegisterMainCard(
                  emailController: rEmailController,
                  nameController: rNameController,
                  passwordController: rPasswordController,
                  registerPressed: () {
                    isPressed = true;
                    setState(() {});
                    registerNewUser(context);
                  },
                  signInPressed: () {
                    _controller.animateToPage(0, duration: const Duration(seconds: 2), curve: Curves.bounceOut);
                    rNameController.clear();
                    rEmailController.clear();
                    rPasswordController.clear();
                  },
                ),
              ],
            ),
            if (isPressed)
              !isLoading
                  ? const Center(
                    child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
          ],
        )
      ),
    );
  }
}
