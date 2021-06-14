import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/modules/home/controllers/home_controller.dart';

class HomeHeroController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  AnimatedHomeController animatedHomeController =
      Get.find<AnimatedHomeController>();
  List<String> droplist;
  var dropdownValue = ''.obs;
  final count = 0.obs;
  @override
  void onInit() {
    droplist = ['Price', 'City', 'Star', 'Status'];
    dropdownValue.value = droplist[0];
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
