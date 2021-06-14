import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marcopolo/app/global/imageBoxShadow.dart';

class TripTypeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: ImageBoxShadow(
                      imgUrl: 'assets/images/airplane.jpg',
                      title: 'Airplane',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ImageBoxShadow(
                      imgUrl: 'assets/images/bus.jpg',
                      title: 'Bus',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: ImageBoxShadow(
                      imgUrl: 'assets/images/car.jpeg',
                      title: 'Car',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ImageBoxShadow(
                      imgUrl: 'assets/images/hice.jpg',
                      title: 'Hice',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
