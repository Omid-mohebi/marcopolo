import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Utils {
  static Widget initBuilder(BuildContext context, widget) {
    return EasyLoading.init()(context, widget);
  }
}
