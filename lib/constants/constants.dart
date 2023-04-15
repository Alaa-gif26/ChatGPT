import 'package:flutter/material.dart';
import 'package:task5_chatgpt/widgets/text_widget.dart';

Color scaffoldBackgroundColor = const Color.fromRGBO(52, 53, 65, 1);
Color cardColor = const Color(0xFF444654);

List<String> models = [
  "Model 1",
  "Model 2",
  "Model 3",
  "Model 4",
  "Model 5",
  "Model 6",
];
List<DropdownMenuItem<String?>>? get getModelsItem {
  List<DropdownMenuItem<String?>>? modelsItems =
      List<DropdownMenuItem<String?>>.generate(
          models.length,
          (index) => DropdownMenuItem(
              value: models[index],
              child: TextWidget(
                label: models[index],
                fontSize: 15,
              )));
  return modelsItems;
}

final chatMessages = [
  {
    "msg": "hello how are you",
    "chatIndex": 0,
  },
  {
    "msg":
        "hello jkljlkjl;jopiewwerffwhgduhiasjod[pso][fpcd][zxv',cxvm,clmvklcljvkoijfkgvjfklljdpojkv lkxjclvjfkjhgjhfjkkdnvjkcc]",
    "chatIndex": 1,
  },
  {
    "msg":
        "hello jopojopjjkljkljlkjklhjlkjlkjljlkjlkjljlkjlkjlkjtttfsdfgfdyasyuggaaaaaaaaaaaaa;;;;;;;;yyyyyyyyytttttttttggggggffffffffffff",
    "chatIndex": 0,
  },
];
