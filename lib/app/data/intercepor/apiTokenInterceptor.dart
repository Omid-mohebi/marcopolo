import 'package:dio/dio.dart';

import '../apiConst.dart';

class ApiTokenInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    options.headers["apikey"] = ApiConsts.apiKey;
    return options;
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    return super.onResponse(response);
  }
}