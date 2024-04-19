import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/login_fingerprint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController extends GetxController {
  final _emailController = TextEditingController();

  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  RxBool isloading = false.obs;

  // firebase signin
  Future<void> siginwithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(const loginFingerprint(), transition: Transition.rightToLeft);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "fail to sign in $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        duration: const Duration(seconds: 3),
      );
    }
  }

  // firebase signup
  Future<void> sigupwithEmailandPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        "user successfully created!",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        duration: const Duration(seconds: 3),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "fail to sign up $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        duration: const Duration(seconds: 3),
      );
    }
  }

  // firebase reset password
  Future<b> resetPassword() async {
    bool isverifed = false;
    try {
      if(isverifed == true){
        await _auth.sendPasswordResetEmail(email: _emailController.text);
      } 
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'user does not exit',
          'please, check your details');
    }
  }

  // firebase log out
  Future<void> siginOut() async {
    await _auth.signOut();
    Get.snackbar(
        snackPosition: SnackPosition.BOTTOM, 'log out successfully', '');
  }
}

// upload user details

Future<void> uploadUser() async {}
