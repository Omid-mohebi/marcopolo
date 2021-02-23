import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppFonts.dart';

class AppTextTheme {
  //headings
//   static TextStyle h1() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 30, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle h2() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 25, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle h3() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 20, fontWeight: AppFontWeight.bold);
//   }

// //bold text
//   static TextStyle b1() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 30, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle b2() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 25, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle b3() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 20, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle b4() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 16, fontWeight: AppFontWeight.bold);
//   }

//   static TextStyle b5() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 14, fontWeight: AppFontWeight.bold);
//   }

// //semi bold
//   static TextStyle sb2() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 20, fontWeight: AppFontWeight.semiBold);
//   }

//   static TextStyle sb3() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 14, fontWeight: AppFontWeight.semiBold);
//   }

//   //regular
//   static TextStyle r2() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 27, fontWeight: AppFontWeight.normal);
//   }

//   //regular medium
//   static TextStyle rm3() {
//     return Get.textTheme.bodyText1
//         .copyWith(fontSize: 16, fontWeight: AppFontWeight.semiBold);
//   }
  static TextStyle normalBText() {
    return Get.textTheme.bodyText1.copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle largBText() {
    return Get.textTheme.bodyText1.copyWith(
      color: Colors.white,
      fontSize: 25,
      // fontWeight: FontWeight.bold,
    );
  }
}
