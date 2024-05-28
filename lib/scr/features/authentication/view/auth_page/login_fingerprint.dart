import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/controller/firebase_controller.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';

class loginFingerprint extends StatefulWidget {
  const loginFingerprint({super.key});

  @override
  State<loginFingerprint> createState() => _loginFingerprintState();
}

class _loginFingerprintState extends State<loginFingerprint> {
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
            InkWell(
              onTap: () async {
                // final isAuthenticated = await _controller.localAuthenicated();
                // if (isAuthenticated) {
                //   Get.off(const homePage(), transition: Transition.rightToLeft);
                // } else {
                //   Get.snackbar(
                //     "Error",
                //     "fail to authenicate user",
                //     snackPosition: SnackPosition.BOTTOM,
                //     backgroundColor: Colors.black,
                //     colorText: Colors.white,
                //     forwardAnimationCurve: Curves.bounceIn,
                //     duration: const Duration(seconds: 3),
                //   );
                // }
              },
              child: const Icon(
                Icons.fingerprint,
                size: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
