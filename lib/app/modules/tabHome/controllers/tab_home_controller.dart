import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/bookMark/views/book_mark_view.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';
import 'package:marcopolo/app/modules/home/views/home_view.dart';
import 'package:marcopolo/app/modules/profile/views/profile_view.dart';

class TabHomeController extends GetxController {
  PageController pageController = PageController();
  // TabController tabController = TabController(vsync: );
  var currentTab = 0.obs;
  List<Widget> screens;
  void pageChanged(int index) {
    currentTab.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.put(
      HomeController(),
    );
    screens = [
      HomeView(),
      BookMarkView(),
      ProfileView(),
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
