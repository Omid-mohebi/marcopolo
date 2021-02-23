import 'package:get/get.dart';

import '../controllers/home_hero_controller.dart';

class HomeHeroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeHeroController>(
      () => HomeHeroController(),
    );
  }
}
