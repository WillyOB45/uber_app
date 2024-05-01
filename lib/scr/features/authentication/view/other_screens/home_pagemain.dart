import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class homeMain extends StatefulWidget {
  const homeMain({super.key});

  @override
  State<homeMain> createState() => _homeMainState();
}

class _homeMainState extends State<homeMain> {
  void _getfromcamera() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () => _getfromcamera(),
              child: CircleAvatar(
                child: Icon(Icons.camera_alt_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
