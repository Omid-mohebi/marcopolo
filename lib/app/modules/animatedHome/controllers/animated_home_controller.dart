import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';

class AnimatedHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController controller;
  Animation<Offset> offsetAnimation;
  Animation<Offset> soffsetAnimation;
  Animation<Offset> toffsetAnimation;
  Animation<Offset> foffsetAnimation;
  var secondPage = false.obs;
  String selectedImg = '';
  String selectedText = '';
  var heroTag = ''.obs;
  HomeController homeController = Get.find<HomeController>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.3, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    soffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.3, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    toffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1.3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    foffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
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
