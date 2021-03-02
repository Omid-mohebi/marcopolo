import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/global/fatButton.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';
import 'package:marcopolo/app/modules/profileSettingNotLogin/controllers/profile_setting_not_login_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   radius: 70,
          //   child: ClipOval(
          //     child: Image.network(FirebaseAuth.instance.currentUser.photoURL),
          //   ),
          // ),
          Center(
            child: ClipOval(
              child: Image.network(
                FirebaseAuth.instance.currentUser.photoURL,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              controller.name.length == 3
                  ? '${controller.firstName.capitalize} ${controller.middleName.capitalize}\n${controller.lastName.capitalize}'
                  : '${controller.firstName.capitalize}\n${controller.lastName.capitalize}',
              style: AppTextTheme.superLargBText()
                  .copyWith(color: AppColors.pink, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          // Text(
          //   controller.lastName.capitalize,
          //   style: TextStyle(color: AppColors.pink),
          //   textAlign: TextAlign.center,
          // ),
          // Spacer(),
          FatButton(text: 'Language'),
          FatButton(text: 'Privacy Policy'),
          FatButton(text: 'About Us'),
          FatButton(
            text: 'Logout',
            // buttonColor: AppColors.pink,
            textColor: AppColors.pink,
            onTap: () async {
              await AuthController.to.signOut().then((value) =>
                  Get.find<ProfileController>().pageController.animateToPage(1,
                      duration: Duration(milliseconds: 1), curve: Curves.ease));
              Get.find<ProfileSettingNotLoginController>().controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}
