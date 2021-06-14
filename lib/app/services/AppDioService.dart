import 'package:dio/dio.dart';
import 'package:marcopolo/app/data/apiConst.dart';
import 'package:marcopolo/app/data/intercepor/RequestInterceptor.dart';
import 'package:marcopolo/app/data/intercepor/apiTokenInterceptor.dart';

class AppDioService {
  static Dio getDioInstance() {
    Dio _dio = new Dio();

    final BaseOptions options = new BaseOptions(
      baseUrl: ApiConsts.baseUrl,
      connectTimeout: 15000,
      receiveTimeout: 13000,
    );

    _dio.options = options;
    _dio.interceptors
      ..add(ApiTokenInterceptor())
      ..add(RequestInterceptor())
      // ..add(Get.find<Alice>().getDioInterceptor())
      ..add(LogInterceptor(responseBody: true));

    return _dio;
  }
}