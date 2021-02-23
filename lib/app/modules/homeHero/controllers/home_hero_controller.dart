import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';

class HomeHeroController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  AnimatedHomeController animatedHomeController =
      Get.find<AnimatedHomeController>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
