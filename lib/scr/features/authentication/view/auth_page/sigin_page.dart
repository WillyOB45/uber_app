import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/fingerprint.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/forget_password.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/login_fingerprint.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/register_page.dart';
import 'package:uber_project/widgets/my_button.dart';
import 'package:uber_project/widgets/my_textfield.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  // user controller
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: 900,
          width: 400,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.black]),
              image: DecorationImage(
                  image: const AssetImage(
                    "assets/uber_background.jpg",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcATop),
                  opacity: (3))),
          child: Column(
            children: [
              const SizedBox(
                height: 160,
              ),

              // uber title
              Container(
                  height: 100,
                  child: const Text(
                    "RideSwift",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        letterSpacing: 3,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 160,
              ),

              // email textfield
              myTextfiled(
                controller: _emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                title: "Enter your email",
              ),

              // password controller
              myTextfiled(
                  title: "Enter password",
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  icon: Icons.security),
              const SizedBox(
                height: 10,
              ),

              // forget password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const forgetPassword());
                  },
                  child: const Text(
                    "forget passsword?",
                    style: TextStyle(
                        fontSize: 13, letterSpacing: 2, color: Colors.white),
                  ),
                ),
              ),

              // login button
              const SizedBox(
                height: 20,
              ),
              myButton(
                  onTap: () {
                    Get.offAll(const loginFingerprint(),
                        transition: Transition.cupertino);
                  },
                  text: "sign in"),
              const SizedBox(
                height: 10,
              ),

              // don't have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don't have an account?",
                    style: TextStyle(
                        fontSize: 13, letterSpacing: 2, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const registerPage(),
                          transition: Transition.circularReveal);
                    },
                    child: const Text(
                      "Register here",
                      style: TextStyle(
                          fontSize: 13, letterSpacing: 2, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //social logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/google.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        "assets/applelogo.png",
                        fit: BoxFit.contain,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
