import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/Shared_preferences/shared_screen.dart';
import 'package:pagination/Shared_preferences/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestScrren extends StatefulWidget {
  const FirestScrren({Key? key}) : super(key: key);

  @override
  _FirestScrrenState createState() => _FirestScrrenState();
}

class _FirestScrrenState extends State<FirestScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello${finalEmail}",
              style: TextStyle(fontSize: 30),
            ),
            MaterialButton(
              child: Text("Remove"),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove("email");
                Get.to(
                  const SharedScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
