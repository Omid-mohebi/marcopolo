import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/start_trip_controller.dart';

class StartTripView extends GetView<StartTripController> {
  @override
  Widget build(BuildContext context) {
    Get.put(StartTripController());
    void func() {
      if (controller.pageController.page == 0) {
        Get.find<AnimatedHomeController>().secondController.reverse();
        Timer(Duration(milliseconds: 250), () {
          Get.find<AnimatedHomeController>().secondPage.value = false;
        });
        Get.find<AnimatedHomeController>().secondPageAnimation.value = false;
      } else if (controller.pageController.page == 1) {
        controller.pageController.animateToPage(0,
            duration: Duration(milliseconds: 500),
            curve: controller.myEaseOutBack);
      } else {
        controller.pageController.animateToPage(1,
            duration: Duration(milliseconds: 500),
            curve: controller.myEaseOutBack);
      }
    }

    Future<bool> onWillPop() async {
      func();
      return true;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.pageController.page == 0) {
                        Get.back();
                        Get.find<AnimatedHomeController>()
                            .secondController
                            .reverse();
                        Timer(Duration(milliseconds: 250), () {
                          Get.find<AnimatedHomeController>().secondPage.value =
                              false;
                        });
                        Get.find<AnimatedHomeController>()
                            .secondPageAnimation
                            .value = false;
                      } else if (controller.pageController.page == 1) {
                        controller.pageController.animateToPage(0,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear);
                      } else {
                        controller.pageController.animateToPage(1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Entypo.chevron_left, color: AppColors.pink),
                        Text(
                          'Back',
                          style: AppTextTheme.normalBText()
                              .copyWith(color: AppColors.pink),
                        ),
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: controller.screens,
          controller: controller.pageController,
        ),
      ),
    );
  }
}
