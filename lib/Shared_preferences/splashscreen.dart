import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/Shared_preferences/firstscreen.dart';
import 'package:pagination/Shared_preferences/shared_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class SplashScrren extends StatefulWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
        Duration(seconds: 2),
        () => Get.to(
          finalEmail == null ? SharedScreen() : FirestScrren(),
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var oldemail = preferences.getString("email");

    setState(() {
      finalEmail = oldemail;
    });
    print("finalemail==>>${finalEmail}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade200,
    );
  }
}
