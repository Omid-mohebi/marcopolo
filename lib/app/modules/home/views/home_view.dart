import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Coast(
      beaches: controller.beaches,
      controller: controller.coastController,
      physics: NeverScrollableScrollPhysics(),
      observers: [
        CrabController(),
      ],
    );
  }
}
