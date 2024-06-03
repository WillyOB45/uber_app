import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/controller/firebase_controller.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/home_pagemain.dart';
import 'package:uber_project/utilis/loading_widget.dart';

class loginFingerprint extends StatefulWidget {
  const loginFingerprint({super.key});

  @override
  State<loginFingerprint> createState() => _loginFingerprintState();
}

class _loginFingerprintState extends State<loginFingerprint> {
  bool isloading = false;
  final FirebaseController _controller = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "scan your fingerprint to login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            isloading == false
                ? InkWell(
                    onTap: () async {
                      Get.to(const homePage());
                    },
                    child: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 100,
                    ),
                  )
                : loadingWidget()
          ],
        ),
      ),
    );
  }
}
