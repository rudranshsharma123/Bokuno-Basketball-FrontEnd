import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeachResultsScreen extends StatefulWidget {
  @override
  _SeachResultsScreenState createState() => _SeachResultsScreenState();
}

class _SeachResultsScreenState extends State<SeachResultsScreen> {
  @override
  final String pythonEnd = 'http://10.0.2.2:12345/image';
  String img;
  Future<String> login() async {
    final uri = Uri.http('10.0.2.2:12345', '/send');
    final response = await http.get(uri);
    print(response.body);
    return response.body;
  }
  // @mustCallSuper
  // void mount(Element parent, Object newSlot) {
  //   login();
  // }

  // String state = "";
  // Image image;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var x = await login();
                var y = x.split(',');
                print(y.length);
              },
              child: Text('Hello'))
        ],
      ),
      // body: FutureBuilder<List>(
      //       future: my,
      //       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      //         {
      //           List<Widget> children;
      //           if (snapshot.hasData) {
      //             children = <Widget>[];
      //             for (var i in snapshot.data) {
      //               var concatenate = "";
      //               // print(i['stars'][0]);
      //               for (var j in i['stars']) {
      //                 concatenate = j;
      //               }

      //               children.add();
      //             }
      //           } else if (snapshot.hasError) {
      //             children = <Widget>[
      //               const Icon(
      //                 Icons.error_outline,
      //                 color: Colors.red,
      //                 size: 60,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 16),
      //                 child: Text('Error: ${snapshot.error}'),
      //               )
      //             ];
      //           } else {
      //             children = const <Widget>[
      //               SizedBox(
      //                 child: CircularProgressIndicator(),
      //                 width: 60,
      //                 height: 60,
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(top: 16),
      //                 child: Text('Awaiting result...'),
      //               )
      //             ];
      //           }
      //           return Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: children,
      //             ),
      //           );
      //         }
      //       }),
    );
  }
}
