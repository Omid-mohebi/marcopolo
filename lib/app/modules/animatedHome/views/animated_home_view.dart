import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/imageBoxShadow.dart';
import 'package:marcopolo/app/modules/home/views/slider.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/animated_home_controller.dart';

class AnimatedHomeView extends StatefulWidget {
  @override
  _AnimatedHomeViewState createState() => _AnimatedHomeViewState();
}

class _AnimatedHomeViewState extends State<AnimatedHomeView>
    with AutomaticKeepAliveClientMixin<AnimatedHomeView> {
  var controller = Get.put(AnimatedHomeController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => AnimatedOpacity(
                opacity: controller.secondPage.value ? 0 : 1,
                duration: Duration(
                  milliseconds: 100,
                ),
                child: SlideTransition(
                    position: controller.foffsetAnimation,
                    child: CarouselDemo()),
              )),
          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 3,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Obx(
                  () => Row(
                    children: [
                      controller.heroTag.value == '1'
                          ? Expanded(
                              child: Crab(
                                tag: '1',
                                child: ImageBoxShadow(
                                  myTag: '1',
                                  title: 'Hotels',
                                  imgUrl: 'assets/images/8.jpg',
                                  // homeController: controller,
                                ),
                              ),
                            )
                          : Expanded(
                              child: Obx(() => AnimatedOpacity(
                                    opacity:
                                        controller.secondPage.value ? 0 : 1,
                                    duration: Duration(
                                      milliseconds: 100,
                                    ),
                                    child: SlideTransition(
                                      position: controller.soffsetAnimation,
                                      child: ImageBoxShadow(
                                        myTag: '1',
                                        title: 'Hotels',
                                        imgUrl: 'assets/images/8.jpg',
                                        // homeController: controller,
                                      ),
                                    ),
                                  )),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      controller.heroTag.value == '2'
                          ? Expanded(
                              child: Crab(
                                tag: '2',
                                child: ImageBoxShadow(
                                  myTag: '2',
                                  title: 'Resturants',
                                  imgUrl: 'assets/images/6.jpg',
                                  // homeController: controller,
                                ),
                              ),
                            )
                          : Expanded(
                              child: Obx(() => AnimatedOpacity(
                                    opacity:
                                        controller.secondPage.value ? 0 : 1,
                                    duration: Duration(
                                      milliseconds: 100,
                                    ),
                                    child: SlideTransition(
                                      position: controller.offsetAnimation,
                                      child: ImageBoxShadow(
                                        myTag: '2',
                                        title: 'Resturants',
                                        imgUrl: 'assets/images/6.jpg',
                                        // homeController: controller,
                                      ),
                                    ),
                                  )),
                            ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Obx(
                () => Row(
                  children: [
                    controller.heroTag.value == '3'
                        ? Expanded(
                            child: Crab(
                              tag: '3',
                              child: ImageBoxShadow(
                                myTag: '3',
                                title: 'Tours',
                                imgUrl: 'assets/images/3.jpg',
                                // homeController: controller,
                              ),
                            ),
                          )
                        : Expanded(
                            child: Obx(() => AnimatedOpacity(
                                  opacity: controller.secondPage.value ? 0 : 1,
                                  duration: Duration(
                                    milliseconds: 100,
                                  ),
                                  child: SlideTransition(
                                    position: controller.soffsetAnimation,
                                    child: ImageBoxShadow(
                                      myTag: '3',
                                      title: 'Tours',
                                      imgUrl: 'assets/images/3.jpg',
                                      // homeController: controller,
                                    ),
                                  ),
                                )),
                          ),
                    SizedBox(
                      width: 15,
                    ),
                    controller.heroTag.value == '4'
                        ? Expanded(
                            child: Crab(
                              tag: '4',
                              child: ImageBoxShadow(
                                myTag: '4',
                                title: 'Trip Guide',
                                imgUrl: 'assets/images/9.jpg',
                                // homeController: controller,
                              ),
                            ),
                          )
                        : Expanded(
                            child: Obx(() => AnimatedOpacity(
                                  opacity: controller.secondPage.value ? 0 : 1,
                                  duration: Duration(
                                    milliseconds: 100,
                                  ),
                                  child: SlideTransition(
                                    position: controller.offsetAnimation,
                                    child: ImageBoxShadow(
                                      myTag: '4',
                                      title: 'Trip Guide',
                                      imgUrl: 'assets/images/9.jpg',
                                      // homeController: controller,
                                    ),
                                  ),
                                )),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Obx(() => AnimatedOpacity(
                  opacity: controller.secondPage.value ? 0 : 1,
                  duration: Duration(
                    milliseconds: 100,
                  ),
                  child: SlideTransition(
                    position: controller.toffsetAnimation,
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
                  ),
                )),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
