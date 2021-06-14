import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/theme/AppColors.dart';

enum DialogType { ERROR, DONE, QUESTION, MESSAGE }

class AppGetDialog {
  static show({
    String title,
    String mainButtonText,
    @required String middleText,
    List<Widget> actions,
  }) {
    title = title == null ? "Error" : title;
    return Get.defaultDialog(
      backgroundColor: Colors.white,
      title: title,
      titleStyle: TextStyle(color: Colors.black),
      middleText: middleText,
      radius: 10,

      actions: actions == null || actions.isEmpty ? <Widget>[] : actions,
      confirm: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          mainButtonText != null ? mainButtonText : "Got it".tr,
          style: TextStyle(
            color: Get.theme.accentColor,
          ),
        ),
      ),

      // cancel: Text("OK"),
    );
  }

  static showSuccess({@required String middleText}) {
    show(
      title: "Done".tr,
      middleText: middleText,
    );
  }

  static showWithRetryCallBack(
      {@required String middleText,
      Function retryCallBak,
      String operationTitle,
      String retryButtonText}) {
    show(
      middleText: operationTitle == null
          ? middleText
          : "while".tr + " " + operationTitle + " " + middleText,
      actions: retryCallBak == null
          ? <Widget>[]
          : <Widget>[
              TextButton(
                child: Text("Retry"),
                onPressed: () {
                  Get.back();
                  retryCallBak();
                },
              ),
            ],
    );
  }
}
