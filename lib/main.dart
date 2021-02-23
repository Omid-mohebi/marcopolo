import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/home/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  // List<Widget> screens;

  // List<Widget> screens = [
  //   HomeView(),
  //   BookMarkView(),
  //   ProfileView(),
  // ];
  var showBNB = true.obs;
  Get.put(showBNB, tag: "global_bool", permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      // builder: (context, child) {
      //   return Scaffold(
      //     body: child,
      //     bottomNavigationBar: Obx(() => Container(
      //           height: showBNB.value ? 90 : 0,
      //           color: Colors.white,
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 50),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 IconButton(
      //                   icon: Icon(
      //                     Foundation.home,
      //                     size: 30,
      //                   ),
      //                   onPressed: () {
      //                     print('1111');
      //                   },
      //                 ),
      //                 IconButton(
      //                   icon: Icon(
      //                     Foundation.bookmark,
      //                     size: 30,
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //                 IconButton(
      //                   icon: Icon(
      //                     Ionicons.md_person,
      //                     size: 30,
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )),
      //   );
      // return DefaultTabController(
      //   length: 3,
      //   child: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: [
      // Padding(
      //   padding: const EdgeInsets.only(bottom: 50.0),
      //   child: child,
      // ),
      // GestureDetector(
      //   onTap: () {
      // return Navigator.of(Get.context).push(
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => BookMarkView(),
      //   ),
      // );
      //   Get.toNamed(Routes.PROFILE);
      // },
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 15),
      //   child: TabBar(
      //     labelColor: Colors.black,
      //     unselectedLabelColor: AppColors.decative,
      //     indicatorSize: TabBarIndicatorSize.label,
      //     indicatorColor: AppColors.pink,
      //     // indicatorWeight: 3,
      //     indicator: RoundUnderlineTabIndicator(
      //       borderSide: BorderSide(
      //         width: 3,
      //         color: AppColors.pink,
      //       ),
      //     ),
      //     tabs: [
      //       //TODO add khaled icon
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 12),
      //         child: Icon(
      //           Foundation.home,
      //           size: 30,
      //         ),
      //       ),
      //       //TODO add khaled icon
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 12),
      //         child: Icon(
      //           Foundation.bookmark,
      //           size: 30,
      //           // color: controller.currentTab.value == 0
      //           //     ? AppColors.darkBlue
      //           //     : AppColors.chartBlue,
      //         ),
      //       ),
      //       //TODO add khaled icon
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 12),
      //         child: Icon(
      //           Ionicons.md_person,
      //           size: 30,
      //           // color: controller.currentTab.value == 0
      //           //     ? AppColors.darkBlue
      //           //     : AppColors.chartBlue,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      //         )
      //       ],
      //     ),
      //   );
      // },
    ),
  );
}
