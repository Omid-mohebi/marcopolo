import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/fatButton.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';

import '../controllers/profile_setting_not_login_controller.dart';

class ProfileSettingNotLoginView
    extends GetView<ProfileSettingNotLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Obx(() {
            print(
                "${lerpDouble(180, 0, controller.v())} bla bla ${controller.controller.value}");
            return Icon(
              MaterialCommunityIcons.face,
              size: lerpDouble(180, 0, controller.v()),
              // size: lerpDouble(0, 180, controller.v()),
            );
          }),
          Spacer(),
          SlideTransition(
            position: controller.soffsetAnimation,
            child: Text(
              'You don\'t have any account yet!',
              style: TextStyle(color: AppColors.pink),
            ),
          ),
          // Spacer(),
          SlideTransition(
              position: controller.offsetAnimation,
              child: FatButton(text: 'Language')),
          SlideTransition(
              position: controller.offsetAnimation,
              child: FatButton(text: 'Privacy Policy')),
          SlideTransition(
              position: controller.offsetAnimation,
              child: FatButton(text: 'About Us')),
          SlideTransition(
            position: controller.offsetAnimation,
            child: FatButton(
              text: 'Login',
              buttonColor: AppColors.pink,
              textColor: Colors.white,
              onTap: () {
                Timer(Duration(milliseconds: 100), () {
                  Get.find<ProfileController>().pageController.animateToPage(0,
                      duration: Duration(milliseconds: 1), curve: Curves.ease);
                });
                Get.find<ProfileController>().controller.forward();
                controller.controller.forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
