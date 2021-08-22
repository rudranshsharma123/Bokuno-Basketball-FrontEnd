import 'package:flutter/material.dart';
import 'package:yourgarden/depriciated/Login_Screen.dart';
import 'package:yourgarden/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Text(
                "Welcome to Travelisory",
                style: TextStyle(fontSize: 30, color: kButtonColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your One stop for making your travel easier",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right:20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "A bot is trained to handle your travel related questions like: Is it safe to trave to India? (the information is from the CDC advisiory) You can also ask question like help me plan a daycation. The bot will help you in making your decision. You can also ask question like what are the nunber of cases in India to get the number of Cases in the country of your choosing ",
                style: TextStyle(fontSize: 10, color: kButtonColor),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // color: Colors.white60,
                child: Text(
                  "Enter",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
