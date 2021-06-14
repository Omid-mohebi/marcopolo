import 'dart:async';
import 'dart:math';

import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/global/itemCard.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/modules/home/views/secondSlider.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';
import '../controllers/home_hero_controller.dart';

class HomeHeroView extends GetView<HomeHeroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (c, v) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              forceElevated: v,
              leading: Container(),
              elevation: 0,
              pinned: false,
              // stretch: true,
              expandedHeight: 150.0,
              // snap: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Obx(
                    () => Crab(
                      tag: controller.animatedHomeController.heroTag.value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              controller.animatedHomeController.selectedImg,
                              // '',
                              fit: BoxFit.fitWidth,
                            ),
                            height: 150,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent
                                ],
                              ),
                            ),
                            height: 150,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.2),
                            height: 150,
                          ),
                          Center(
                            child: Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Entypo.chevron_left,
                                    color: Colors.white,
                                    size: 37,
                                  ),
                                  onPressed: () {
                                    // controller.secondPage.value = false;
                                    print(controller
                                        .animatedHomeController.heroTag.value);
                                    Get.find<AnimatedHomeController>()
                                        .secondPage
                                        .value = false;
                                    Get.find<AnimatedHomeController>()
                                        .controller
                                        .reverse();
                                    controller.homeController.coastController
                                        .animateTo(
                                            beach: 0,
                                            duration:
                                                Duration(milliseconds: 200),
                                            curve: Curves.easeInOut);
                                    Timer(Duration(milliseconds: 500), () {
                                      Get.find<AnimatedHomeController>()
                                          .heroTag
                                          .value = '0';
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  // '',
                                  controller
                                      .animatedHomeController.selectedText,
                                  style: AppTextTheme.largBText(),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Icon(
                                  Entypo.chevron_left,
                                  color: Colors.white.withOpacity(0),
                                  size: 37,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            controller.animatedHomeController.selectedText == 'Hotels'
                ? SliverAppBar(
                    backgroundColor: Colors.white,
                    forceElevated: v,
                    leading: Container(),
                    elevation: 0,
                    pinned: true,
                    // stretch: true,
                    expandedHeight: 55.0,
                    // snap: true,
                    floating: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hotels near you:',
                              style: AppTextTheme.normalBText(),
                            ),
                            Container(
                              height: 50,
                              width: 120,
                              child: Obx(
                                () => DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  isExpanded: true,
                                  value: controller.dropdownValue.value,
                                  icon: Icon(
                                    Entypo.chevron_down,
                                    size: 15,
                                    color: AppColors.pink,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (String newValue) {
                                    controller.dropdownValue.value = newValue;
                                  },
                                  items: controller.droplist
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text('sot by: $value',
                                            style: AppTextTheme.normalBText()
                                                .copyWith(
                                                    color: AppColors.pink)),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(),
                  )
          ];
        },
        body: controller.animatedHomeController.selectedText == 'Hotels'
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                  ItemCards(),
                ],
              )
            : PageViewWidget(),
      ),
    );
  }
}
