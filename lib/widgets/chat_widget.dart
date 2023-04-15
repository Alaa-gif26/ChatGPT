import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task5_chatgpt/constants/constants.dart';
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
          padding: const EdgeInsets.all(10),
          color: chatIndex==0 ?scaffoldBackgroundColor:cardColor,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIndex==0 ? AssetsManager.userImage: AssetsManager.botImage,
                width: 30,
                height: 30,
              ),
              Expanded(child: TextWidget(label: msg)),
              chatIndex==0 ? SizedBox.shrink():Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children:const [
                  Icon(Icons.thumb_up_alt_outlined,color: Colors.white,),
                  SizedBox(width: 5,),
                  Icon(Icons.thumb_down_alt_outlined,color: Colors.white,)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
