import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task5_chatgpt/constants.dart';
import 'package:task5_chatgpt/services/assets_manager.dart';
import 'package:task5_chatgpt/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: cardColor,
          child: Row(
            children: [
              Image.asset(
                AssetsManager.userImage,
                width: 30,
                height: 30,
              ),
              TextWidget(label: "Hello here our msg")
            ],
          ),
        )
      ],
    );
  }
}
