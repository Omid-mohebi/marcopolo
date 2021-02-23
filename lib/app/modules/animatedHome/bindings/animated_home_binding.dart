import 'package:get/get.dart';

import '../controllers/animated_home_controller.dart';

class AnimatedHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AnimatedHomeController(),
    );
  }
}
