import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:yourgarden/components/my_bottom_nav_bar.dart';
import 'package:yourgarden/components/my_button.dart';
import '../constants.dart';


class UploadPage extends StatefulWidget {
  // UploadPage({Key key, this.url}) : super(key: key);

  // final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<String> stingImages;
  String _gotAns = "";
  // List<Widget> images = []

  String _searchText, _returnText = "";
  List<Image> image = [];
  List<Widget> images = [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('Here are your Search Results'),
    )
  ];
  Future<void> textSearch(searchText) async {
    final body = {"search": searchText};
    final jsonString = json.encode(body);
    // var request = http.post(url);
    final uri = Uri.http('192.168.29.106:12345', '/search');
    // print(uri);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.post(uri, body: jsonString);

    // var res = jsonDecode(response.body);
    print("Result: ${response.statusCode}");
    var x = jsonDecode(response.body);
    var y = x['image'][0];
    images.add(Image.memory(
        base64Decode(y.toString().substring(2, y.toString().length - 1))));

    // for (var i in y) {
    //   image.add(Image.memory(
    //       base64Decode(i.toString().substring(2, i.toString().length - 1))));
    // }
    // for (var j in image) {
    //   images.add(j);
    // }
  }

  Future<String> uploadImage(filename, url) async {
    // List<String> images;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      await http.MultipartFile.fromPath('picture', filename),
    );
    request.headers.putIfAbsent('connection', () => "keep-alive");
    request.headers.putIfAbsent('Connection', () => "Keep-Alive");
    request.headers.putIfAbsent('max-age', () => '100000');
    // request.headers.putIfAbsent("Content-Type", () => "application/json");
    print(request.headers.entries);
    http.Response response =
        await http.Response.fromStream(await request.send());
    var res = jsonDecode(response.body);
    _searchText = res['ans'];
    print(_searchText);
    return _searchText;
  }

  TextEditingController controller;

  String state = "";
  String url = 'http://192.168.29.106:12345/image';
  String url2 = "http://172.18.106.187:12345/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
        appBar: AppBar(
          title: Text('Jina Search'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller,
                  obscureText: false,
                  onChanged: (value) {
                    _searchText = value;
                    // print(_email);
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
                    labelText: "Enter your search query",
                    labelStyle: TextStyle(color: kBorderColor),
                    focusColor: kButtonColor,
                    fillColor: Colors.red,
                    hoverColor: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  MyButton(
                    text: "Search",
                    press: () {
                      textSearch(_searchText);
                      setState(() {
                        _gotAns = "sas";
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    text: "Search With an Image Instead? (tap to choose)",
                    press: () async {
                      var file = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      var res = await uploadImage(file.path, url);

                      setState(() {
                        // state = res;
                        // images = res;
                        // print(res);
                        state = res;
                        // state = res.toString();
                      });
                    },
                  )
                ],
              ),
              state == ""
                  ? Text('No Image Selected')
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 40, bottom: 40),
                      child: Text(
                        state,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
              _gotAns == ""
                  ? Text("No search made")
                  : Column(
                      children: images,
                    ),
            ],
          ),
        ));
  }
}
