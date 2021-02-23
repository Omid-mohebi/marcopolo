import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/imageBoxShadow.dart';
import 'package:marcopolo/app/modules/home/views/slider.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/animated_home_controller.dart';

class AnimatedHomeView extends GetView<AnimatedHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselDemo(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Row(
                children: [
                  ImageBoxShadow(
                    title: 'Hotel',
                    imgUrl: 'assets/images/8.jpg',
                    homeController: controller,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageBoxShadow(
                    title: 'Resturants',
                    imgUrl: 'assets/images/6.jpg',
                    homeController: controller,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  ImageBoxShadow(
                    title: 'Tours',
                    imgUrl: 'assets/images/3.jpg',
                    homeController: controller,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageBoxShadow(
                    title: 'Trip Guide',
                    imgUrl: 'assets/images/9.jpg',
                    homeController: controller,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Container(
              height: 80,
              color: AppColors.pink,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start a Trip',
                    style: AppTextTheme.largBText(),
                  ),
                  Icon(
                    Entypo.chevron_right,
                    color: Colors.white,
                    size: 37,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
