import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
    Get.put(
      AnimatedHomeController(),
    );
    Get.put(Get.context, tag: "global_context", permanent: true);
  }
}
