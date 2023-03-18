import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:whatsapp_ui/utils/constants.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade400,
            ),
            SizedBox(width: 7),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'online',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.videocam),
          SizedBox(width: 20),
          Icon(Icons.call),
          SizedBox(width: 20),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                colorFilter: ColorFilter.mode(
                    Colors.brown.shade400, BlendMode.colorBurn),
                image: AssetImage('images/background.jpg'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 50, left: 50),
                  padding: EdgeInsets.all(20),
                  color: Colors.yellow.shade100,
                  child: Text(
                    'Messages and calls are end-to-end encrypted. No one outside of this chat can read or listen. Tap to learn more',
                  ),
                ),
                SizedBox(height: 20),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
                _getChatSample(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getChatSample() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: ChatBubble(
            alignment: Alignment.centerLeft,
            backGroundColor: Colors.white,
            clipper: ChatBubbleClipper1(
              type: BubbleType.receiverBubble,
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              child: Text(
                lorem(paragraphs: 1, words: Random().nextInt(20)),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: ChatBubble(
            alignment: Alignment.centerRight,
            backGroundColor: chatGreen,
            clipper: ChatBubbleClipper10(
              type: BubbleType.sendBubble,
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              child: Text(
                lorem(paragraphs: 1, words: Random().nextInt(20)),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
