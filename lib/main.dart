import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/home/bindings/home_binding.dart';
import 'package:marcopolo/utils/utils.dart';
import 'app/routes/app_pages.dart';
import 'app/services/AppDioService.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.white));

  // var showBNB = true.obs;
  // Get.put(showBNB, tag: "global_bool", permanent: true);
  Get.put(AppDioService.getDioInstance());
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.red
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.black.withOpacity(0.7)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom
    ..dismissOnTap = false;
}
