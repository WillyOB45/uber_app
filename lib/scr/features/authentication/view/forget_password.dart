import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/register_page.dart';
import 'package:uber_project/scr/features/authentication/view/sigin_page.dart';
import 'package:uber_project/widgets/my_button.dart';
import 'package:uber_project/widgets/my_textfield.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  // user controller
  final _emailController = TextEditingController();

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
                    "UBER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        letterSpacing: 3,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 160,
              ),

              const Text(
                "Forget password?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 3,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                "Enter the email address associated with your account",
                style: TextStyle(
                    fontSize: 15, letterSpacing: 3, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),

              // email textfield
              myTextfiled(
                controller: _emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                title: "Enter your email",
              ),

              // login button
              const SizedBox(
                height: 20,
              ),
              myButton(
                  onTap: () {
                    Get.to(const signIn(),
                        transition: Transition.leftToRightWithFade);
                  },
                  text: "send"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
