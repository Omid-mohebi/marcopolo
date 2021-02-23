import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

class ImageBoxShadow extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String myTag;
  // final AnimatedHomeController homeController;
  // final Function goto;
  ImageBoxShadow({this.imgUrl, this.title, this.myTag});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // homeController.secondPage.value = true;
        Get.find<AnimatedHomeController>().selectedImg = imgUrl;
        Get.find<AnimatedHomeController>().selectedText = title;
        Get.find<AnimatedHomeController>().heroTag.value = myTag;
        Get.find<AnimatedHomeController>().controller.forward();
        Timer(
          Duration(milliseconds: 100),
          () => {
            Get.find<HomeController>().coastController.animateTo(
                beach: 1,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut)
          },
        );

        // print(Get.find<AnimatedHomeController>().heroTag);
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
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
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Text(
              title,
              style: AppTextTheme.normalBText(),
            ),
          )
        ],
      ),
    );
  }
}
