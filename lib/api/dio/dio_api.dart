import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../interceptors/api_interceptors.dart';
import 'dio_constants.dart';

@module
@immutable
abstract class DioModule {
  @lazySingleton
  Dio client(ApiInterceptor interceptor) {
    return Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
        interceptor,
      ]);
  }

  @lazySingleton
  EmptyDio emptyClient() => EmptyDio(Dio());
}

class EmptyDio {
  final Dio dio;

  EmptyDio(this.dio);
}
