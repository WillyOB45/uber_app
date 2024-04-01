import 'package:flutter/material.dart';
import 'package:uber_project/scr/features/authentication/view/other_screens/settings.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // bottom navbar index
  int currentIndex = 0;

  // screens page
  final List<Widget> _screens = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.green,
    ),
    const settingPage(),
  ];

  // bottom navbar function
  void bottomNavBar(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => bottomNavBar(index),
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.grey.shade900,
          unselectedItemColor: Colors.grey.shade500,
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.route_outlined,
                ),
                label: "route"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_3,
                ),
                label: "profile")
          ]),
      body: _screens[currentIndex],
    );
  }
}
