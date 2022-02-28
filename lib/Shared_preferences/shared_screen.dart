import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/Shared_preferences/firstscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({Key? key}) : super(key: key);

  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shard "),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
          ),
          TextField(
            controller: pass,
          ),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString("email", email.text);
              Get.to(
                const FirestScrren(),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
