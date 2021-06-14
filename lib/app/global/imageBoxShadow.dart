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
  final bool notTheSecondPage;
  final VoidCallback ontap;
  // final AnimatedHomeController homeController;
  // final Function goto;
  ImageBoxShadow(
      {this.imgUrl,
      this.title,
      this.myTag,
      this.notTheSecondPage = false,
      this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // homeController.secondPage.value = true;
        if (notTheSecondPage == false) {
          Get.find<AnimatedHomeController>().selectedImg = imgUrl;
          Get.find<AnimatedHomeController>().selectedText = title;
          Get.find<AnimatedHomeController>().heroTag.value = myTag;
          Get.find<AnimatedHomeController>().controller.forward();
          Timer(
            Duration(milliseconds: 1),
            () {
              Get.find<AnimatedHomeController>().secondPage.value = true;
              Get.find<HomeController>().coastController.animateTo(
                  beach: 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            },
          );
        } else {
          ontap();
        }
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
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
              style: AppTextTheme.normalBText().copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
