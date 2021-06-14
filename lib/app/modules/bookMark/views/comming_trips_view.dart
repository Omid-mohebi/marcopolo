import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/itemCard.dart';

class CommingTripsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          ItemCards(
            hasDots: true,
          ),
          ItemCards(
            hasDots: true,
          ),
          ItemCards(
            hasDots: true,
          ),
        ],
      ),
    );
  }
}
