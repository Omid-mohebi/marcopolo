import 'package:coast/coast.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/views/animated_home_view.dart';
import 'package:marcopolo/app/modules/homeHero/views/home_hero_view.dart';

class HomeController extends GetxController {
  // var secondPage = false.obs;
  // String selectedImg = '';
  // String selectedText = '';
  final beaches = [
    Beach(builder: (context) => AnimatedHomeView()),
    Beach(builder: (context) => HomeHeroView()),
    // Beach(builder: (context) => Zoutelande()),
  ];
  final coastController = CoastController();
  // Get.put(t);
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
