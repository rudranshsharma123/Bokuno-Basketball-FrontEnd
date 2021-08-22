import 'package:flutter/material.dart';
import 'package:yourgarden/Screens/image_upload_screen.dart';
import 'package:yourgarden/Screens/jina_chatbot.dart';
import 'package:yourgarden/Screens/diagflow_chatbot.dart';
import 'package:yourgarden/Screens/word_cloud.dart';

import '../constants.dart';
import '../depriciated/homepage.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding / 4,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: kButtonColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UploadPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyChatScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.chat_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JinaChatBot()));
            },
          ),
          IconButton(
            icon: Icon(Icons.assistant),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
