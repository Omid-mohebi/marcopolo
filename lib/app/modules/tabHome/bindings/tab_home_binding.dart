import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/modules/bookMark/controllers/book_mark_controller.dart';
import 'package:marcopolo/app/modules/login/controllers/login_controller.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';
import 'package:marcopolo/app/modules/profileSettingNotLogin/controllers/profile_setting_not_login_controller.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabHomeController>(
      () => TabHomeController(),
    );
    Get.put(AuthController());
    Get.put(
      ProfileController(),
    );
    Get.put(
      LoginController(),
    );
    Get.put(
      ProfileSettingNotLoginController(),
    );
    Get.put(BookMarkController());
  }
}
