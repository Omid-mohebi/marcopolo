import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PostTripsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'You didn\'t complete any trip yet!',
        ),
      ),
    );
  }
}
