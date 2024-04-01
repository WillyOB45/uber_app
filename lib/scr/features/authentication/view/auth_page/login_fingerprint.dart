import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';

class loginFingerprint extends StatefulWidget {
  const loginFingerprint({super.key});

  @override
  State<loginFingerprint> createState() => _loginFingerprintState();
}

class _loginFingerprintState extends State<loginFingerprint> {
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
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                    backgroundColor: Colors.grey.shade300,
                    title: "scan your fingerprint",
                    content: GestureDetector(
                      onTap: () {
                        Get.offAll(const homePage());
                        Get.showSnackbar(GetSnackBar(
                          duration: const Duration(seconds: 5),
                          backgroundColor: Colors.grey.shade300,
                          snackPosition: SnackPosition.BOTTOM,
                          title: "",
                          isDismissible: true,
                          message: "",
                          messageText: Text("login successfully!"),
                        ));
                      },
                      child: const Icon(
                        Icons.fingerprint,
                        size: 70,
                      ),
                    ));
              },
              child: const Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
