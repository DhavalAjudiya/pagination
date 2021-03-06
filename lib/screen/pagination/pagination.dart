import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination/screen/passenger_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PagiNation extends StatefulWidget {
  const PagiNation({Key? key}) : super(key: key);

  @override
  _PagiNationState createState() => _PagiNationState();
}

class _PagiNationState extends State<PagiNation> {
  List<String> data = [];

  ScrollController _controller = ScrollController();
  getPsssenger() async {
    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=1&size=10");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        data.add(jsonDecode(response.body));
        print("aaa===>>${data}");
      });
    } else {
      throw Exception("Failed to lode images");
    }
  }

  fetchFive() {
    for (int i = 0; i < 5; i++) {
      getPsssenger();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFive();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        fetchFive();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PAGINATION"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, index) {
                  final passenger = data[index];
                  return ListTile(
                    title: Text("${passenger[0]}"),
                    subtitle: Text("${data[index]}"),
                    trailing: Text("${data[index]}"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemCount: data.length),
          ),
        ],
      ),
    );
  }
}
