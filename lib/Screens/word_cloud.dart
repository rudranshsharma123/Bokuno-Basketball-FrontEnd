
import "package:flutter/material.dart";
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:http/http.dart' as http;

import 'package:yourgarden/components/my_bottom_nav_bar.dart';
// import 'package:yourgarden/homepage.dart';

import '../constants.dart';

class WordCloud extends StatefulWidget {
  @override
  _WordCloudState createState() => _WordCloudState();
}

class _WordCloudState extends State<WordCloud> {
  final int count = 1;

  // int i = 10;

  Future<List<String>> getWords() async {
    final uri = Uri.https('server.rudranshsharma3.repl.co', '/wordcloud');
    print(uri);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri);
    // print();
    // for (var i in body) {}
    print('here');
    print(response.body);
    // print(jsonDecode(response.body));
    // print(jsonDecode(response.body)['result']);
    print('here');

    return response.body.split(" ");
  }

  @override
  Widget build(BuildContext context) {
    Future<List<String>> words = getWords();
    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: kButtonColor),
        title: Text(
          'Word Cloud',
          style: TextStyle(color: kButtonColor),
        ),
        actions: [],
      ),
      body: Center(
          child: FutureBuilder<List>(
              future: words,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[];
                    int j = 0;
                    for (var i in snapshot.data) {
                      j++;
                      children.add(ScatterItem(i, 1, j % 2 == 0));
                    }
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ];
                  }
                  return FittedBox(
                    child: Center(
                      child: Scatter(
                        fillGaps: true,
                        delegate:
                            ArchimedeanSpiralScatterDelegate(ratio: ratio),
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    ),
                  );
                }
              })),
    );
  }
}

class ScatterItem extends StatelessWidget {
  ScatterItem(this.hashtag, this.index, this.rotate);
  final String hashtag;
  final int index;
  final bool rotate;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 20,
          color: kButtonColor,
        );
    return RotatedBox(
      quarterTurns: rotate ? 1 : 0,
      child: Text(
        hashtag,
        style: style,
      ),
    );
  }
}


