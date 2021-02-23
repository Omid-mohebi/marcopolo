import 'package:get/get.dart';

class AnimatedHomeController extends GetxController {
  var secondPage = false.obs;
  String selectedImg = '';
  String selectedText = '';
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
