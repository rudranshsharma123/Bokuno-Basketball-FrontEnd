import 'package:flutter/material.dart';
import 'package:yourgarden/components/my_bottom_nav_bar.dart';
import 'package:yourgarden/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int count;
  String route = 'diagChat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      appBar: AppBar(
        actions: [],
        title: Text(
          'Chat',
          style: TextStyle(color: kButtonColor),
        ),
        iconTheme: IconThemeData(color: kButtonColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChatFormField(
            pass: false,
          )
        ],
      ),
    );
  }
}

class ChatFormField extends StatelessWidget {
  final String label;
  final bool pass;
  const ChatFormField({Key key, this.label, this.pass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: pass,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: kButtonColor,
            ),
            suffixIcon: Icon(
              Icons.send,
              color: kButtonColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kBorderColor, width: 5.0, style: BorderStyle.solid),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kBorderColor, width: 2.0, style: BorderStyle.solid),
            ),
            labelText: label,
            labelStyle: TextStyle(color: kBorderColor),
            focusColor: kButtonColor,
            fillColor: Colors.red,
            hoverColor: Colors.black),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.sender, @required this.text, @required this.isMe});
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text(
          //   sender,
          //   style: TextStyle(color: Colors.white, fontSize: 15.0),
          // ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 10,
              shadowColor: Colors.blueGrey,
              color: isMe ? kButtonColor : kTextcolor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color: isMe ? kTextcolor : Colors.black, fontSize: 15.0),
                ),
              ),
            ),
          ),
        ]);
  }
}
