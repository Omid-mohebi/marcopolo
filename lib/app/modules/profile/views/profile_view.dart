import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin<ProfileView> {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: PageView(
        children: controller.screens,
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
