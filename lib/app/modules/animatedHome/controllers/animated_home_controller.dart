import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';

class AnimatedHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController controller;
  AnimationController secondController;
  Animation<Offset> offsetAnimation;
  Animation<Offset> soffsetAnimation;
  Animation<Offset> toffsetAnimation;
  Animation<Offset> foffsetAnimation;
  Animation<Offset> anotherOffsetAnimation;
  Animation<Offset> anothersOffsetAnimation;
  var secondPage = false.obs;
  var secondPageAnimation = false.obs;
  String selectedImg = '';
  String selectedText = '';
  var heroTag = ''.obs;
  HomeController homeController = Get.find<HomeController>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    secondController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.3, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutExpo,
      ),
    );
    soffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.3, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutExpo,
      ),
    );
    toffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1.3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutExpo,
      ),
    );
    foffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutExpo,
      ),
    );
    anotherOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -7),
    ).animate(
      CurvedAnimation(
        parent: secondController,
        curve: Curves.linear,
      ),
    );
    anothersOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.3),
    ).animate(
      CurvedAnimation(
        parent: secondController,
        curve: Curves.linear,
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
