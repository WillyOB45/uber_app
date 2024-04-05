import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget() {
  return Center(
      child: LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 50));
}
