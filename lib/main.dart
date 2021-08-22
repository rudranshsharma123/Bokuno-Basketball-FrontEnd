import 'package:flutter/material.dart';
import 'package:yourgarden/depriciated/display_results.dart';
import 'package:yourgarden/Screens/image_upload_screen.dart';
import 'package:yourgarden/Screens/jina_chatbot.dart';
import 'package:yourgarden/Screens/diagflow_chatbot.dart';
import 'package:yourgarden/components/routes.dart';
import 'package:yourgarden/constants.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String route = '/';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        buttonColor: kButtonColor,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: kButtonColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kButtonColor),
          ),
        ),
      ),
      home: JinaChatBot(),
      initialRoute: MyApp().route,
      routes: {
        diagChat: (context) => MyChatScreen(),
        searchResults: (context) => SeachResultsScreen(),
        uploadPage: (context) => UploadPage(),
      },
    );
  }
}
