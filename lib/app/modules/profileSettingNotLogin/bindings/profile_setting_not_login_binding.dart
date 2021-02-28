import 'package:get/get.dart';

import '../controllers/profile_setting_not_login_controller.dart';

class ProfileSettingNotLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfileSettingNotLoginController(),
    );
  }
}
