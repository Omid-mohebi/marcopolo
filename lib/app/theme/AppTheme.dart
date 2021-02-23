import 'package:flutter/material.dart';
import 'package:marcopolo/app/theme/AppFonts.dart';

import 'AppColors.dart';

class AppTheme {
  static ThemeData dark() {
    // final _textTheme = ThemeData.dark().textTheme.apply(
    //       bodyColor: AppColors.lgt2,
    //       // fontFamily: AppFonts.avenir_regular,
    //       fontFamily: AppFonts.acuminSemiCond,
    //     );
    return ThemeData(
      // fontFamily: AppFonts.acuminSemiCond,
      // brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      // accentColor: AppColors.green,
      // textTheme: ThemeData.dark().textTheme.apply(
      //       bodyColor: AppColors.lgt2,
      //       // fontFamily: AppFonts.avenir_regular,
      //       fontFamily: AppFonts.acuminSemiCond,
      //     ),
      // primaryTextTheme: ThemeData.dark().textTheme.apply(
      //       fontFamily: AppFonts.acuminSemiCond,
      //     ),
      // accentTextTheme: ThemeData.dark().textTheme.apply(
      //       fontFamily: AppFonts.acuminSemiCond,
      //     ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
      ),

      // errorColor: AppColors.superRed,
    );
  }
}
