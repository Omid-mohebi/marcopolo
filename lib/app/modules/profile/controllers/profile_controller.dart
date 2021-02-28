import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/modules/login/views/login_view.dart';
import 'package:marcopolo/app/modules/profileSetting/controllers/profile_setting_controller.dart';
import 'package:marcopolo/app/modules/profileSetting/views/profile_setting_view.dart';
import 'package:marcopolo/app/modules/profileSettingNotLogin/views/profile_setting_not_login_view.dart';

class ProfileController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Widget> screens;
  final count = 0.obs;
  PageController pageController;
  AnimationController controller;
  @override
  void onInit() async {
    // get.hashCode
    super.onInit();

    pageController = PageController(
        initialPage:
            await AuthController.to.isUserSignedInedToFirebase() ? 2 : 1);
    screens = [
      LoginView(),
      ProfileSettingNotLoginView(),
      ProfileSettingView(),
    ];
    Get.put(ProfileSettingController());
  }

  @override
  void onReady() {
    super.onReady();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
