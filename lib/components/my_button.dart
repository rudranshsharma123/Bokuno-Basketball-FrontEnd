import 'package:flutter/material.dart';

import '../constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function press;
  const MyButton({Key key, this.text, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: kTextcolor),
          ),
        ),
      ),
    );
  }
}
