import 'package:flutter/material.dart';

class myTextfiled extends StatelessWidget {
  final String title;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obscureText;
  IconData? icon;
  myTextfiled(
      {super.key,
      required this.title,
      required this.controller,
      required this.keyboardType,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: title,
              constraints: const BoxConstraints(maxHeight: 60),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(icon)),
        ),
      ),
    );
  }
}
