import 'dart:convert';

import 'package:pagination/modal/paginationmodal.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Pagination?> fatchPostData(int select) async {
    final url = "https://yeay-dev.xc.io/search";
    Map<String, dynamic> body = {
      "searchText": "wom",
      "pageIndex": select,
      "limit": 20,
      "returnQueryCount": true
    };
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      print("response  ==>>>${response.body}");
      if (response.statusCode == 200) {
        return Pagination.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e, st) {
      print("error ==>>> ${e}===>>>${st}");
    }
  }
}
