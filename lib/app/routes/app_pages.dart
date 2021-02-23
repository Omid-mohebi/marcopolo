import 'package:get/get.dart';

import 'package:marcopolo/app/modules/animatedHome/bindings/animated_home_binding.dart';
import 'package:marcopolo/app/modules/animatedHome/views/animated_home_view.dart';
import 'package:marcopolo/app/modules/bookMark/bindings/book_mark_binding.dart';
import 'package:marcopolo/app/modules/bookMark/views/book_mark_view.dart';
import 'package:marcopolo/app/modules/home/bindings/home_binding.dart';
import 'package:marcopolo/app/modules/home/views/home_view.dart';
import 'package:marcopolo/app/modules/homeHero/bindings/home_hero_binding.dart';
import 'package:marcopolo/app/modules/homeHero/views/home_hero_view.dart';
import 'package:marcopolo/app/modules/profile/bindings/profile_binding.dart';
import 'package:marcopolo/app/modules/profile/views/profile_view.dart';
import 'package:marcopolo/app/modules/tabHome/bindings/tab_home_binding.dart';
import 'package:marcopolo/app/modules/tabHome/views/tab_home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.TAB_HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAB_HOME,
      page: () => TabHomeView(),
      binding: TabHomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_MARK,
      page: () => BookMarkView(),
      binding: BookMarkBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ANIMATED_HOME,
      page: () => AnimatedHomeView(),
      binding: AnimatedHomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_HERO,
      page: () => HomeHeroView(),
      binding: HomeHeroBinding(),
    ),
  ];
}
