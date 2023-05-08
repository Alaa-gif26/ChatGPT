import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task5_chatgpt/providers/models_provider.dart';
import 'package:task5_chatgpt/services/api_services.dart';

import '../models/chat_models.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void aadUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<Void> sendMessageAndGetAnswers ({required String msg, required String chosenModelId})async{
  chatList.addAll(await ApiService.sendMessage(message:msg, modelId: chosenModelId))
  }
}
