import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yourgarden/depriciated/chat_screen.dart';
import 'package:yourgarden/Screens/diagflow_chatbot.dart';
import 'package:yourgarden/components/form_field.dart';
import 'package:yourgarden/components/my_button.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<String> register(String username, String password) async {
    final body = {"username": username, "password": password};
    final jsonString = json.encode(body);
    final uri = Uri.https('server.rudranshsharma3.repl.co', '/register');
    print(uri);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.post(uri, body: jsonString);
    // print();
    // for (var i in body) {}
    print('here');
    print(response.body);
    // print(jsonDecode(response.body));
    // print(jsonDecode(response.body)['result']);
    print('here');

    return response.body;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void clearTextFeild() {
    emailController.clear();
    passwordController.clear();
  }

  String _email, _password;
  // String _email;

  bool isCorrect = true;

  bool isUser = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:MyBottomNavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: kButtonColor),
        title: Text(
          'Travelisory',
          style: TextStyle(color: kButtonColor),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "Welcome New User!",
                style: TextStyle(
                    fontSize: 30, color: kButtonColor, letterSpacing: 5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                obscureText: false,
                onChanged: (value) {
                  _email = value;
                  print(_email);
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: kBorderColor,
                        width: 5.0,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: kBorderColor,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                  labelText: "Your Email",
                  labelStyle: TextStyle(color: kBorderColor),
                  focusColor: kButtonColor,
                  fillColor: Colors.red,
                  hoverColor: Colors.black,
                  errorText: !(isUser) ? "Sorry Username already taken" : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: kBorderColor,
                          width: 5.0,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: kBorderColor,
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                    labelText: "You Password",
                    labelStyle: TextStyle(color: kBorderColor),
                    focusColor: kButtonColor,
                    fillColor: Colors.red,
                    // errorText: !(isCorrect) ? "Wrong Password" : null,
                    hoverColor: Colors.black),
              ),
            ),
            Row(
              children: [
                MyButton(
                  text: "Sign Up",
                  press: () async {
                    String response = await register(_email, _password);
                    print(_email+_password);
                    if (response == "SUCESSS, Your ID is created") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyChatScreen(),
                        ),
                      );
                    } else {
                      print("notnt");
                      isUser = false;
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

