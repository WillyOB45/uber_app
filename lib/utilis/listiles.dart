import 'package:flutter/material.dart';

Widget lisTiles({
  Widget? leading,
  Widget? title,
  Widget? trailing,
}) {
  return Card(
      color: Colors.white,
      child: ListTile(
        leading: leading,
        title: title,
        trailing: trailing,
      ));
}
