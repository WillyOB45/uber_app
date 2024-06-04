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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                width: 270,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where do you want to go",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  user!.email.toString(),
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.grey.shade900,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Cars's Available Nearby You",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
