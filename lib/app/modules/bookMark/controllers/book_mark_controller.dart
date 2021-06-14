import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/bookMark/views/comming_trips_view.dart';
import 'package:marcopolo/app/modules/bookMark/views/post_trips_view.dart';

class BookMarkController extends GetxController {
  var isSelected = true.obs;
  List<Widget> screens;
  PageController pageController = PageController(
      // initialPage: isSelected.value ? 0 : 1,
      );
  Curve myEaseOutBack = Cubic(0.175, 0.885, 0.39, 1.1);
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    screens = [
      CommingTripsView(),
      PostTripsView(),                
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
