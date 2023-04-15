import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task5_chatgpt/constants/api_consts.dart';

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BaseUrl/models"),
        headers: {"Authorization": "Bearer $ApiKey"},
      );
      Map jsonResponse = jsonDecode(response.body);
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print("error $error");
    }
  }
}
