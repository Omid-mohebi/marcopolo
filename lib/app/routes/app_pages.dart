import 'package:get/get.dart';

import 'package:marcopolo/app/modules/home/bindings/home_binding.dart';
import 'package:marcopolo/app/modules/home/views/home_view.dart';
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
  ];
}
