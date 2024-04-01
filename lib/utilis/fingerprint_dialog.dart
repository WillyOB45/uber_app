import 'package:flutter/material.dart';

class fingerprintDialog extends StatefulWidget {
  const fingerprintDialog({super.key});

  @override
  State<fingerprintDialog> createState() => _fingerprintDialogState();
}

class _fingerprintDialogState extends State<fingerprintDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        height: 300,
        width: 300,
        color: Colors.amber,
      ),
    );
  }
}
