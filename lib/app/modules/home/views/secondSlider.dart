import 'dart:math';

import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  List<VacationBean> list = VacationBean.generate();

  PageController pageController;

  double viewportFraction = 0.8;

  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);

        double angle = (pageOffset - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
            top: 70 - scale * 25,
            bottom: 20,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.0,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 500,
                  height: double.infinity,
                  child: Image.asset(
                    list[index].url,
                    // width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    // alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
                  ),
                ),
                Container(
                  width: 500,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent
                      ],
                    ),
                  ),
                  // color: ,
                ),
                Positioned(
                  bottom: 45,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      list[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    child: Text(
                      list[index].subName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                        // letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}

class VacationBean {
  String url;
  String name;
  String subName;
  VacationBean(this.url, this.name, this.subName);

  static List<VacationBean> generate() {
    return [
      VacationBean("assets/images/1.jpg", "Mazar", 'Afganistan'),
      VacationBean("assets/images/2.jpg", "Estalef", 'Afghanistan'),
      VacationBean("assets/images/3.jpg", "Herat", 'Afganistan'),
      VacationBean("assets/images/4.jpg", "Paris", 'France'),
      VacationBean("assets/images/5.jpg", "Sin Yang", 'China'),
    ];
  }
}
