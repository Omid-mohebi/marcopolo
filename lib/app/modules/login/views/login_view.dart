import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/global/fatButton.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';
import 'package:marcopolo/app/modules/profileSettingNotLogin/controllers/profile_setting_not_login_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // physics: BouncingScrollPhysics(),
        children: [
          // Spacer(),
          SlideTransition(
            position: controller.offsetAnimation,
            child: Text(
              'Please Select One of The Sign-in\n\nMethods below!',
              style: AppTextTheme.normalBText().copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Spacer(
          //   flex: 2,
          // ),
          Column(
            // crossAxisAlignment: ,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SlideTransition(
              //   position: controller.soffsetAnimation,
              //   child: FatButton(
              //     onTap: () {
              //       print('taped');
              //       AuthController.to.signInWithGoogle();
              //     },
              //     text: 'Google',
              //     heading: Icon(
              //       AntDesign.google,
              //       size: 45,
              //       color: AppColors.pink,
              //     ),
              //   ),
              // ),
              // Spacer(),
              SlideTransition(
                position: controller.soffsetAnimation,
                child: FatButton(
                  onTap: () {
                    print('taped');
                    AuthController.to.signInWithGoogle();
                  },
                  text: 'Google',
                  heading: Icon(
                    AntDesign.google,
                    size: 45,
                    color: AppColors.pink,
                  ),
                ),
              ),
              SlideTransition(
                position: controller.soffsetAnimation,
                child: FatButton(
                  onTap: () {
                    AuthController.to.signInWithFacebook();
                  },
                  text: 'Facebook',
                  heading: Icon(
                    Ionicons.logo_facebook,
                    size: 50,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              SlideTransition(
                position: controller.soffsetAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      Get.find<ProfileController>().controller.reverse();
                      Timer(
                        Duration(milliseconds: 150),
                        () {
                          Get.find<ProfileController>()
                              .pageController
                              .animateToPage(1,
                                  duration: Duration(milliseconds: 1),
                                  curve: Curves.ease);
                          Get.find<ProfileSettingNotLoginController>()
                              .controller
                              .reverse();
                          // Get.find<>().
                        },
                      );
                    },
                    child: Text(
                      'Cancle',
                      style: AppTextTheme.superLargBText().copyWith(
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Spacer()
        ],
      ),
    );
  }
}
