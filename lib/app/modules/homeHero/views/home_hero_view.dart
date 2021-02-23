import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';
import '../controllers/home_hero_controller.dart';

class HomeHeroView extends GetView<HomeHeroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Obx(
              () => Crab(
                // tag: '1',
                tag: controller.animatedHomeController.heroTag.value,
                // targetTag: controller.selectedImg,
                // child: Container(
                //   height: 100,
                //   width: 100,
                //   color: Colors.red,
                // ),
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
                                  .controller
                                  .reverse();
                              controller.homeController.coastController
                                  .animateTo(
                                      beach: 0,
                                      duration: Duration(milliseconds: 150),
                                      curve: Curves.easeInOut);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            // '',
                            controller.animatedHomeController.selectedText,
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
        ],
      ),
    );
  }
}
