import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task5_chatgpt/constants.dart';
import 'package:task5_chatgpt/services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(padding: EdgeInsets.all(10),
        color: cardColor,
          child: Row(children: [
            Image.asset(AssetsManager.userImage,width: 30,height: 30,),
            Text("data")
          ],),
        )
      ],
    );
  }
}