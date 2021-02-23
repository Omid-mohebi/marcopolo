import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marcopolo/app/modules/tabHome/views/circleIndicator.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: AppColors.decative,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.pink,
            // indicatorWeight: 3,
            indicator: RoundUnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: AppColors.pink,
              ),
            ),
            tabs: [
              //TODO add khaled icon
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Icon(
                  Foundation.home,
                  size: 30,
                ),
              ),
              //TODO add khaled icon
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Icon(
                  Foundation.bookmark,
                  size: 30,
                  // color: controller.currentTab.value == 0
                  //     ? AppColors.darkBlue
                  //     : AppColors.chartBlue,
                ),
              ),
              //TODO add khaled icon
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Icon(
                  Ionicons.md_person,
                  size: 30,
                  // color: controller.currentTab.value == 0
                  //     ? AppColors.darkBlue
                  //     : AppColors.chartBlue,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              // height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //TODO add svg
                    Text(
                      'MarcoPolo',
                      style: TextStyle(fontSize: 30),
                    ),
                    Expanded(child: Container()),
                    //TODO add khaled icon
                    IconButton(
                      icon: Icon(
                        MaterialCommunityIcons.chat_outline,
                        size: 35,
                      ),
                      //TODO: add functionalety
                      onPressed: () {
                        Get.find<RxBool>(tag: 'global_bool').value =
                            !Get.find<RxBool>(tag: 'global_bool').value;
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: TabBarView(
                children: controller.screens,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Container(
//               height: 90,
//               color: Colors.amber,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         selectedIndex.value = 0;
//                       },
//                       child: Expanded(
//                         child: Obx(
//                           () => Icon(
//                             Foundation.home,
//                             size: 30,
//                             color: selectedIndex.value == 0
//                                 ? Colors.black
//                                 : AppColors.decative,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         selectedIndex.value = 1;
//                       },
//                       child: Expanded(
//                         child: Obx(
//                           () => Icon(
//                             Foundation.bookmark,
//                             size: 30,
//                             color: selectedIndex.value == 1
//                                 ? Colors.black
//                                 : AppColors.decative,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         selectedIndex.value = 2;
//                       },
//                       child: Expanded(
//                         child: Obx(
//                           () => Icon(
//                             Ionicons.md_person,
//                             size: 30,
//                             color: selectedIndex.value == 2
//                                 ? Colors.black
//                                 : AppColors.decative,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
