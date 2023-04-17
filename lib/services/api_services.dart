import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task5_chatgpt/constants/api_consts.dart';
import 'package:task5_chatgpt/models/models_model.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BaseUrl/models"),
        headers: {"Authorization": "Bearer $ApiKey"},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      print("jsonResponse $jsonResponse");

      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        print("Temp $value");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
