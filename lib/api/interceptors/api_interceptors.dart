import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../services/api/token/token_service.dart';

@lazySingleton
class ApiInterceptor extends Interceptor {
  final TokenService _tokenService;

  ApiInterceptor(this._tokenService);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenService.getToken();
    if (token.isEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Accept'] = 'application/json';
    }
    if (kDebugMode) print(token);

    return super.onRequest(options, handler);
  }
}
