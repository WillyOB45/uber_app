import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uber_project/scr/features/authentication/controller/firebase_controller.dart';

Widget loadingWidget() {
  return Obx(() => Visibility(
      visible: Get.find<FirebaseController>().isloading.value,
      child: Center(
          child:
              LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 50))));
}
