import 'package:flutter/material.dart';
import 'package:uber_project/utilis/listiles.dart';

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  //switch state
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: EdgeInsets.all(20.0),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),
              lisTiles(
                leading: const Icon(
                  Icons.person_2_outlined,
                ),
                title: const Text(
                  "Edit profile",
                  style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),

              lisTiles(
                leading: const Icon(
                  Icons.note_alt,
                ),
                title: const Text(
                  "account history",
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
                ),
                trailing: const Icon(
                  size: 14,
                  Icons.arrow_forward_ios,
                ),
              ),

              // preferences
              const SizedBox(
                height: 20,
              ),

              // prefernces
              const Text(
                "Preferences",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),

              lisTiles(
                  leading: const Icon(
                    Icons.login,
                  ),
                  title: const Text(
                    "login notification",
                    style: TextStyle(fontSize: 20),
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
                    style: TextStyle(fontSize: 20),
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
                    style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),
              lisTiles(
                leading: const Icon(
                  Icons.security_sharp,
                ),
                title: const Text(
                  "change password",
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
                ),
                trailing: const Icon(
                  size: 14,
                  Icons.arrow_forward_ios,
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
