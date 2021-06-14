import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingNotLoginController extends GetxController
    with SingleGetTickerProviderMixin {
  final count = 0.obs;
  Animation<Offset> offsetAnimation;
  Animation<Offset> soffsetAnimation;
  var v = 1.0.obs;
  bool notSelectedYet = true;
  AnimationController controller;
  @override
  void onInit() {
    ever(v, (_) {
      print("v() is now ${v.value}");
    });
    super.onInit();
    controller = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    controller.addListener(() {
      v.value = controller.value;
      print(controller.value);
      print(lerpDouble(0, 180, v()));
    });
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInBack,
      ),
    );
    soffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInBack,
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
