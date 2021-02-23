import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

import '../controllers/home_hero_controller.dart';

class HomeHeroView extends GetView<HomeHeroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Crab(
              // tag: controller.selectedImg,
              // targetTag: controller.selectedImg,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      // controller.selectedImg,
                      '',
                      fit: BoxFit.fitWidth,
                    ),
                    height: 150,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.2),
                    height: 150,
                  ),
                  Center(
                    child: Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Entypo.chevron_left,
                            color: Colors.white,
                            size: 37,
                          ),
                          onPressed: () {
                            // controller.secondPage.value = false;
                          },
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          '',
                          // controller.selectedText,
                          style: AppTextTheme.largBText(),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(
                          Entypo.chevron_left,
                          color: Colors.white.withOpacity(0),
                          size: 37,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
