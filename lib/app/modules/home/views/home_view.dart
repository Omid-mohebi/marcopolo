import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/global/imageBoxShadow.dart';
import 'package:marcopolo/app/modules/home/views/slider.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Coast(
      beaches: controller.beaches,
      controller: controller.coastController,
      observers: [
        CrabController(),
      ],
    );
  }
}
