import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';

class ImageUploadClass extends StatefulWidget {
  @override
  _ImageUploadClassState createState() => _ImageUploadClassState();
}

class _ImageUploadClassState extends State<ImageUploadClass> {
  @override
  final String pythonEnd = 'http://10.0.2.2:12345/image';
  String img;
  Future<String> login() async {
    final uri = Uri.http('10.0.2.2:12345', '/send');
    final response = await http.get(uri);
    print(response.body);
    return response.body;
  }

  String state = "";
  Image image;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                    img = await login();
                  setState(() {
                    image = Image.memory(base64Decode(img));
                  });
                },
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          Container(child: image

              )
          // file == null ? Text('No Image Selected') : Image.file(file)
        ],
      ),
    );
  }
}
