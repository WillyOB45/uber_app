import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),

          // customize appbar
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    size: 40,
                    color: Colors.grey.shade900,
                  )),
              const SizedBox(
                width: 250,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade900),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          //greeting pleasaries
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              color: Colors.amber,
              // alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user!.email.toString(),
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
