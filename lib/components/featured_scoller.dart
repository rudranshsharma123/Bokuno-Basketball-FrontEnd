import 'package:flutter/material.dart';

import '../constants.dart';
// import 'package:reclax/constants.dart';

class FeaturedScoller extends StatelessWidget {
  const FeaturedScoller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturedImageText(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
          FeaturedImageText(
            image: "assets/images/bottom_img_1.png",
            press: () {},
          ),
          FeaturedImageText(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturedImageText extends StatelessWidget {
  const FeaturedImageText({
    Key key,
    this.press,
    this.image,
  }) : super(key: key);
  final Function press;
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
