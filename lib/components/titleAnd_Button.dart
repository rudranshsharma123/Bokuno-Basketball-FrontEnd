import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonAndTittleUnderline extends StatelessWidget {
  const ButtonAndTittleUnderline({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Row(
        children: [
          TextWithUnderline(
            text: text,
          ),
          Spacer(),
          TextButton(
            onPressed: press,
            child: Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextWithUnderline extends StatelessWidget {
  const TextWithUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              color: kPrimaryColor.withOpacity(0.2),
              height: 7,
            ),
          ),
        ],
      ),
    );
  }
}
