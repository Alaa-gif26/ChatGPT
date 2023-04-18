import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task5_chatgpt/constants/api_consts.dart';
import 'package:task5_chatgpt/models/chat_models.dart';
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
        print("Temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }

//send msg function
  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
    var response = await http.post(Uri.parse("$BaseUrl/completions"),
          headers: {
            "Authorization": "Bearer $ApiKey",
            "Content-Type" :"application/json",
          },
          body: jsonEncode({
            "model": modelId,
            "messages": message,
            "max_tokens": 100,
          }));
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }

      List <ChatModel> chatList=[];
    if (jsonResponse["choices"].legth >0) {
    //  print("jsonResponse["choices"]text ${jsonResponse["choices"][0]["text]} )
    chatList=List.generate(jsonResponse["choices"].legth, (index) => ChatModel(msg: jsonResponse["choices"][index]["text"] , chatIndex: 1)
    
   ); }
    return chatList;
    
  } catch (error) {
    print("error $error");
      rethrow;
  }
  }

  
}



