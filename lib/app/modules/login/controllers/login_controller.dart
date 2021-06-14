import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  Animation<Offset> offsetAnimation;
  Animation<Offset> soffsetAnimation;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(
        parent: Get.find<ProfileController>().controller,
        curve: Curves.easeInBack,
      ),
    );
    soffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1),
    ).animate(
      CurvedAnimation(
          parent: Get.find<ProfileController>().controller,
          curve: Curves.easeInBack),
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
