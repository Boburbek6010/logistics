import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../style/colors.dart';

class SignMainCard extends StatelessWidget {
  final VoidCallback signUpPressed;
  final VoidCallback loginPressed;
  final VoidCallback forgotPasswordPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignMainCard({super.key, required this.signUpPressed, required this.loginPressed, required this.emailController, required this.passwordController, required this.forgotPasswordPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.62, right: MediaQuery.of(context).size.width*0.07, top: MediaQuery.of(context).size.width*0.05, bottom: MediaQuery.of(context).size.width*0.05,),
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
          colors: [Colors.white.withOpacity(0.2), Colors.white12],
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                /// Login
                const Center(
                  child: Text("Login", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                    letterSpacing: 2.5
                  ),),
                ),
                const Spacer(),
                /// Email
                const Text("Your email", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.c5effffff,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Spacer(),
                /// Password
                const Text("Your Password", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.c5effffff,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: InkWell(
                    onTap: forgotPasswordPressed,
                    child: const Text("Forgot Password!", style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),),
                  ),
                ),
                const Spacer(),
                /// Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    onPressed: loginPressed,
                    minWidth: double.infinity,
                    height: 45,
                    shape: const StadiumBorder(),
                    color: AppColors.red,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Let's go", style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward, color: AppColors.white,),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have account?", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),),
                    const SizedBox(width: 7),
                    InkWell(
                      onTap: signUpPressed,
                      child: const Text("Sign UP", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
