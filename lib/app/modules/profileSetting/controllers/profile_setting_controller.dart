import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';

class ProfileSettingController extends GetxController {
  final count = 0.obs;
  String fullName;
  String firstName;
  String middleName;
  String lastName;
  List<String> name;
  void nameAsign() async {
    if (await AuthController.to.isUserSignedInedToFirebase()) {
      fullName = FirebaseAuth.instance.currentUser.displayName;
      print(fullName);
      name = fullName.split(' ');
      // print(fullName);
      firstName = name[0];
      if (name.length == 3) {
        middleName = name[1];
        lastName = name[2];
      } else {
        lastName = name[1];
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    nameAsign();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
