import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';

class fingerPrint extends StatefulWidget {
  const fingerPrint({super.key});

  @override
  State<fingerPrint> createState() => _fingerPrintState();
}

class _fingerPrintState extends State<fingerPrint> {
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
              "Tap to enable fingerprint",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.off(const homePage(), transition: Transition.upToDown);
                Get.snackbar("fingerprint enable successful", '',
                    colorText: Colors.white, backgroundColor: Colors.black);
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
