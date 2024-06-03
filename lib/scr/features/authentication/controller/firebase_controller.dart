import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/login_fingerprint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/sigin_page.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/homePage.dart';
// import 'package:uber_project/utilis/loading_widget.dart';
import "package:local_auth/local_auth.dart";

class FirebaseController extends GetxController {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isloading = false.obs;
  RxBool isLogin = false.obs;
  RxBool isAuthenticated = false.obs;

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
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (email.isNotEmpty && password.isNotEmpty) {
        isLogin.value = true;

        Get.offAll(const loginFingerprint());
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM, 'successfully log in', '');
      } else {
        isLogin.value = false;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "fail to sign in, please check your creditenials and internet connection",
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
  Future<void> sigupwithEmailandPassword(
      String email, String password, String username) async {
    isloading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        isLogin.value = true;
        Get.offAll(const homePage());
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM, 'successfully log in', '');
      } else {
        isLogin.value = true;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "fail to sign in, please check your creditenials ",
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

  // firebase reset password
  Future<void> resetPassword(String email) async {
    try {
      if (email.isNotEmpty) {
        isLogin.value == true;
        isloading.value == true;
        await _auth.sendPasswordResetEmail(email: email);
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'verification email sent!',
            'please check your email');
        Get.to(const signIn());
      } else {
        Get.snackbar(
          "Error",
          "fail to reset password, please check your email! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          forwardAnimationCurve: Curves.bounceIn,
          duration: const Duration(seconds: 3),
        );
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found' || email.isEmpty) {
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'user does not exit',
            'please, check your details');
      }
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

  // upload user details

  Future<void> uploadUser(
    String fullname,
    String email,
  ) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User = {
      "fullname": fullname,
      "email": email,
    };
    await firestore.collection("user").add(User);
  }

  // local auth
  // Future<bool> localAuthenicated() async {
  //   final LocalAuthentication _localauth = LocalAuthentication();
  //  try{
  //    final didAuthenticate = await _localauth.authenticate(
  //     options: const AuthenticationOptions(biometricOnly: true),
  //     localizedReason: "authenticate access to app",
  //   );
  //  }

  // }
}
