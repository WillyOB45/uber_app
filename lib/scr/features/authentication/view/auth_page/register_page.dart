import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/controller/firebase_controller.dart';
// import 'package:uber_project/scr/features/authentication/view/auth_page/fingerprint.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/sigin_page.dart';
// import 'package:uber_project/utilis/loading_widget.dart';
import 'package:uber_project/widgets/my_button.dart';
import 'package:uber_project/widgets/my_textfield.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  // user controller
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  final FirebaseController _authcontroller = Get.put(FirebaseController());

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
                height: 140,
              ),
              // fullname controller
              myTextfiled(
                controller: _fullnameController,
                icon: Icons.person_2_outlined,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                title: "Enter full name",
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
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  icon: Icons.security),
              const SizedBox(
                height: 10,
              ),

              // login button
              const SizedBox(
                height: 20,
              ),
              myButton(
                  onTap: () {
                    _authcontroller.uploadUser(
                        _fullnameController.text, _emailController.text);
                    _authcontroller.sigupwithEmailandPassword(
                        _emailController.text,
                        _passwordcontroller.text,
                        _fullnameController.text);
                  },
                  text: "Sign Up"),
              const SizedBox(
                height: 10,
              ),

              // already have An account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account?",
                    style: TextStyle(
                        fontSize: 13, letterSpacing: 2, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const signIn(), transition: Transition.downToUp);
                    },
                    child: const Text(
                      "sign in",
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
