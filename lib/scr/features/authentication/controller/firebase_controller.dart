import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/login_fingerprint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController extends GetxController {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isloading = false.obs;
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        isLogin.value = true;
      } else {
        isLogin.value = false;
      }
    });
  }

  // firebase signin
  Future<void> siginwithEmailandPassword(String email, String password) async {
    isloading.value = true;
    isLogin.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error",
        "fail to sign in $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isloading.value = false;
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
  Future<void> resetPassword(String email) async {
    try {
      isloading.value == true;
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'user does not exit',
          'please, check your details');
    } finally {
      isloading.value == false;
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

// Future<void> uploadUser() async {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   try{
//     _firestore.collection("user").doc(FirebaseAuth.instance.currentUser.uid).set({
      
//     })
//   }
// }
