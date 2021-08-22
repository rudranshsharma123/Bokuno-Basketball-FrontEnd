import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yourgarden/Screens/diagflow_chatbot.dart';
import 'package:yourgarden/components/form_field.dart';
import 'package:yourgarden/components/my_button.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'Signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<String> login(String username, String password) async {
    final body = {"username": username, "password": password};
    final jsonString = json.encode(body);
    final uri = Uri.https('server.rudranshsharma3.repl.co', '/login');
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
  bool isCorrect = true;
  bool isUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Garden',
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
                "Welcome User!",
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
                  errorText: !(isUser) ? "Sorry User Not Found" : null,
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
                    errorText: !(isCorrect) ? "Wrong Password" : null,
                    hoverColor: Colors.black),
              ),
            ),
            Row(
              children: [
                MyButton(
                  text: 'Log In',
                  press: () async {
                    // String result = "";
                    var response = await login(_email, _password);
                    print("object");
                    // print(response.then((String value) {
                    //   setState(() {
                    //     result = value;
                    //   });
                    // }));
                    // print(result);
                    if (response == "success") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyChatScreen(),
                        ),
                      );
                    } else if (response == "UserNotFound") {
                      setState(() {
                        isUser = false;
                      });
                    } else {
                      setState(() {
                        isCorrect = false;
                      });
                    }
                    clearTextFeild();
                  },
                )
              ],
            ),
            Row(
              children: [
                MyButton(
                  text: "Sign Up",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
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
