import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/sigin_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    navigateToNext();
    super.initState();
  }

  navigateToNext() async {
    await Future.delayed(const Duration(seconds: 10));
    Get.offAll(const signIn(), transition: Transition.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedTextKit(repeatForever: true, animatedTexts: [
          FadeAnimatedText("U B E R",
              textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
