import 'package:flutter/material.dart';

import '../constants.dart';


class RecommenderCardsScroller extends StatelessWidget {
  const RecommenderCardsScroller({
    Key key,
    this.values,
  }) : super(key: key);
  final List values;

  List<Widget> _addinto(BuildContext context) {
    List<Widget> a = [];
    for (var i in values) {
      Image_and_DescpTile n = Image_and_DescpTile(
        name: i[0],
        image: i[1],
        price: "\$" + i[3],
        subheading: i[2],
        press: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DeatilsScreen(),
          //   ),
          // );
        },
      );
      a.add(n);
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: _addinto(context)),
    );
  }
}

// ignore: camel_case_types
class Image_and_DescpTile extends StatelessWidget {
  const Image_and_DescpTile({
    Key key,
    this.image,
    this.name,
    this.subheading,
    this.press,
    this.price,
  }) : super(key: key);

  final String image, name, subheading;
  final Function press;
  final String price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
          margin: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5,
          ),
          width: size.width * 0.4,
          child: Column(
            children: <Widget>[
              Image.asset(image),
              Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: (name + '\n').toUpperCase(),
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextSpan(
                            text: subheading,
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      price,
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
