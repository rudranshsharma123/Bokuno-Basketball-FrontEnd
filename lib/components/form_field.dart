import 'package:flutter/material.dart';

import '../constants.dart';

class MyFormField extends StatelessWidget {
  final String label;
  final bool pass;
  const MyFormField({Key key, this.label, this.pass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: pass,
        onChanged: (value) {
          
        },
        decoration: InputDecoration(
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
