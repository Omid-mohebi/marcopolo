import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselController buttonCarouselController = CarouselController();
List<Widget> items = [
  Container(
    child: Image.asset(
      "assets/images/13.jpg",
      fit: BoxFit.fitWidth,
    ),
    width: 500,
  ),
  Container(
    child: Image.asset(
      "assets/images/2.jpg",
      fit: BoxFit.fitWidth,
    ),
    width: 500,
  ),
  Container(
    child: Image.asset(
      "assets/images/7.jpeg",
      fit: BoxFit.fitWidth,
    ),
    width: 500,
  ),
  // Image.asset("assets/images/13.jpg"),
];

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: items,
              options: CarouselOptions(
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlay: true,
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,

                // aspectRatio:
              ),
            ),
          )
        ],
      );
}
