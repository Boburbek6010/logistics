import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../style/colors.dart';


class RegisterMainCard extends StatelessWidget {
  final VoidCallback signInPressed;
  final VoidCallback registerPressed;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterMainCard({super.key, required this.signInPressed, required this.registerPressed, required this.nameController, required this.emailController, required this.passwordController});

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
                const SizedBox(height: 30,),
                /// Register
                const Center(
                  child: Text("Register", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),),
                ),
                const Spacer(),
                /// Name
                const Text("Your name", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
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
                    hintText: "Name",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
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
                    hintText: "Create password",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Spacer(),
                /// Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MaterialButton(
                    onPressed: registerPressed,
                    minWidth: double.infinity,
                    height: 45,
                    shape: const StadiumBorder(),
                    color: AppColors.red,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Register", style: TextStyle(
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
                    const Text("Already have an account?", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),),
                    const SizedBox(width: 7),
                    InkWell(
                      onTap: signInPressed,
                      child: const Text("Sign In", style: TextStyle(
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
