import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/theme/AppColors.dart';

import '../controllers/book_mark_controller.dart';

class BookMarkView extends GetView<BookMarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isSelected.value = true;
                      controller.pageController.animateToPage(0,
                          duration: Duration(milliseconds: 350),
                          curve: controller.myEaseOutBack);
                    },
                    child: Container(
                      height: 50,
                      color: controller.isSelected.value == true
                          ? Colors.black
                          : AppColors.weakDecative,
                      child: Center(
                        child: Text(
                          'Comming Trips',
                          style: TextStyle(
                            color: controller.isSelected.value == true
                                ? Colors.white
                                : AppColors.strongDecative,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isSelected.value = false;
                      controller.pageController.animateToPage(1,
                          duration: Duration(milliseconds: 350),
                          curve: controller.myEaseOutBack);
                    },
                    child: Container(
                      height: 50,
                      color: controller.isSelected.value == false
                          ? Colors.black
                          : AppColors.weakDecative,
                      child: Center(
                        child: Text(
                          'Post Trips',
                          style: TextStyle(
                            color: controller.isSelected.value == false
                                ? Colors.white
                                : AppColors.strongDecative,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        
        onPageChanged: (ind) {
          if (ind == 0) {
            controller.isSelected.value = true;
            return;
          }
          controller.isSelected.value = false;
        },
        controller: controller.pageController,
        children: controller.screens,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
