import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingNotLoginController extends GetxController
    with SingleGetTickerProviderMixin {
  final count = 0.obs;
  Animation<Offset> offsetAnimation;
  Animation<Offset> soffsetAnimation;
  var v = 1.0.obs;

  AnimationController controller;
  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    controller.addListener(() {
      v.value = controller.value;
      print(controller.value);
      print(lerpDouble(0, 180, v()));
    });
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 2),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutQuint,
      ),
    );
    soffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-2, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutQuint,
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
