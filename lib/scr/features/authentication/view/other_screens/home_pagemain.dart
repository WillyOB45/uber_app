import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homeMain extends StatefulWidget {
  const homeMain({super.key});

  @override
  State<homeMain> createState() => _homeMainState();
}

class _homeMainState extends State<homeMain> {
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;
    // String useremail = user?.email ?? "unknow";
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(user.email.toString())
          ],
        ),
      ),
    );
  }
}
