import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task5_chatgpt/constants.dart';
import 'package:task5_chatgpt/services/assets_manager.dart';
import 'package:task5_chatgpt/widgets/chat_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.openAiLogo),
          ),
          title: const Text("ChatGPT"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                ))
          ],
        ),
        body: Center(
          child: SafeArea(
              child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return ChatWidget(msg: chatMessages[index]["msg"].toString(), chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),);
                    })),
              ),
              if (isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                )
              ],
              SizedBox(
                height: 15,
              ),
              Container(
                color: cardColor,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.grey),
                      controller: textEditingController,
                      onSubmitted: (Value) {},
                      decoration: InputDecoration.collapsed(
                          hintText: "How can i help you",
                          hintStyle: TextStyle(color: Colors.grey)),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
