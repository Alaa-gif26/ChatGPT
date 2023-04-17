import 'package:flutter/material.dart';
import 'package:task5_chatgpt/models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  List<ModelsModel> modelList = [];
  String currentModel = "text-davinci-edit-001";

  List<ModelsModel> get getmodelList {
    return modelList;
  }

  String get getCurrentModel {
    return currentModel;
  }

  void setcurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }
}
