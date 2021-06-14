import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/controller/auth_controller.dart';
import 'package:marcopolo/app/services/AppDioService.dart';

import '../apiConst.dart';

class AuthRepository {
  Dio dio = Get.find();

  Future<dynamic> signin() async {
    var _dio = AppDioService.getDioInstance();
    //TODO handle exception
    var _firebaseIdToken =
        await AuthController.to.firebaseAuth.currentUser.getIdToken();
    _dio.options.headers['idtoken'] = _firebaseIdToken;
    final response = await _dio.post(
      ApiConsts.loginPath,
      data: {},
    );

    return response;
  }
}