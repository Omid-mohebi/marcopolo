import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'MarcoPolo',
                  style: TextStyle(fontSize: 30),
                ),
                Expanded(child: Container()),
                IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.chat_outline,
                    size: 35,
                  ),
                  //TODO: add functionalety
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
