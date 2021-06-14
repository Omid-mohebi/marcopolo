import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/startTrip/views/destination_view.dart';
import 'package:marcopolo/app/modules/startTrip/views/start_point_view.dart';
import 'package:marcopolo/app/modules/startTrip/views/trip_type_view.dart';

class StartTripController extends GetxController {
  List<Widget> screens;
  final count = 0.obs;
  Curve myEaseOutBack = Cubic(0.175, 0.885, 0.39, 1.1);
  PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();

    screens = [DestinationView(), StartPointView(), TripTypeView()];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
