import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_project/scr/features/authentication/controller/firebase_controller.dart';
import 'package:uber_project/scr/features/authentication/view/auth_page/sigin_page.dart';
import 'package:uber_project/utilis/listiles.dart';
import 'package:double_back_to_exit/double_back_to_exit.dart';

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  //switch state
  bool isSwitched = false;
  // firebase controller
  final FirebaseController _authcontroller = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DoubleBackToExit(
          snackBarMessage: "press again to exit",
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),

                // heading
                const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),

                //general
                const Text(
                  "General",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.person_2_outlined,
                  ),
                  title: const Text(
                    "Edit profile",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // account
                const Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),

                lisTiles(
                  leading: const Icon(
                    Icons.note_alt,
                  ),
                  title: const Text(
                    "account history",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.wallet,
                  ),
                  title: const Text(
                    "account statement",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // prefernces
                const Text(
                  "Preferences",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),

                lisTiles(
                    leading: const Icon(
                      Icons.login,
                    ),
                    title: const Text(
                      "login notification",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {},
                    )),
                lisTiles(
                    leading: const Icon(
                      Icons.circle_notifications_outlined,
                    ),
                    title: const Text(
                      "transaction notification",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {},
                    )),
                lisTiles(
                    leading: const Icon(
                      Icons.sunny,
                    ),
                    title: const Text(
                      "dark mode",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {},
                    )),

                // security
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Security",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.security_sharp,
                  ),
                  title: const Text(
                    "change password",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.face,
                  ),
                  title: const Text(
                    "enable face scan",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),

                //customer services
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "contact us",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.email_outlined,
                  ),
                  title: const Text(
                    "rideSwift@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),
                lisTiles(
                  leading: const Icon(
                    Icons.phone,
                  ),
                  title: const Text(
                    "+239031318411",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    size: 14,
                    Icons.arrow_forward_ios,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // login out
                const Text(
                  "log out",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {
                    _authcontroller.siginOut();
                    Get.to(const signIn());
                  },
                  child: lisTiles(
                    leading: const Icon(
                      Icons.logout_outlined,
                    ),
                    title: const Text(
                      "log out",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: const Icon(
                      size: 14,
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
