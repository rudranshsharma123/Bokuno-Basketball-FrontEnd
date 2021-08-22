import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'featured_scoller.dart';
import 'header_and_search.dart';
import 'recommender_images_sroller.dart';
import 'titleAnd_Button.dart';

List images = [
  ["hello", 'assets/images/image_1.png', 'desx', '100'],
  ['Byw', 'assets/images/image_1.png', 'losz', '200'],
  ['blep', 'assets/images/image_1.png', 'kolz', '300'],
];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size, values:images),
          ButtonAndTittleUnderline(
            text: 'Recommended',
            press: () {},
          ),
          RecommenderCardsScroller(
            values: images,
          ),
          ButtonAndTittleUnderline(
            text: "Featured",
            press: () {},
          ),
          FeaturedScoller(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
