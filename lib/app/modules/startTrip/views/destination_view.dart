import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/fatButton.dart';
import 'package:marcopolo/app/modules/startTrip/controllers/start_trip_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

class DestinationView extends GetView<StartTripController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
            child: Text(
              'Select your destination',
              style: AppTextTheme.superLargBText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              onTap: () {
                Timer(Duration(milliseconds: 100), () {
                  // SystemChrome.setEnabledSystemUIOverlays([]);
                  print('object');
                });
              },
              style: AppTextTheme.superLargBText().copyWith(
                fontWeight: FontWeight.w300,
                // color: AppColors.decative,
                fontSize: 25,
              ),
              cursorColor: Colors.black,
              cursorWidth: 1,
              cursorHeight: 35,
              decoration: InputDecoration(
                hintText: ' Search here',
                hintStyle: AppTextTheme.superLargBText().copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.decative,
                  fontSize: 25,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          FatButton(
            onTap: () {
              // controller.pageController.animateTo(1,
              //     duration: Duration(milliseconds: 500),
              //     curve: Curves.easeInBack);
              // print('hhhhhh');
              controller.pageController.animateToPage(1,
                  duration: Duration(milliseconds: 250), curve: Curves.linear);
            },
            heading: Text(
              'Herat',
              style: AppTextTheme.superLargBText().copyWith(
                color: Colors.white,
              ),
            ),
            text: '',
            buttonColor: AppColors.strongDecative,
            trailing: Icon(
              Entypo.chevron_right,
              color: Colors.white,
              size: 37,
            ),
          ),
          FatButton(
            // text: 'Select on Map',
            // textColor: AppColors.strongDecative,
            textWidget: Text(
              'Select on Map',
              style: AppTextTheme.superLargBText().copyWith(
                color: AppColors.strongDecative,
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
