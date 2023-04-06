import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../exceptions/application_exception.dart';
import '../exceptions/api_exception.dart';
import '../../l10n/localization_helper.dart';
import '../exceptions/auth_exception.dart';
import 'models/base_error.dart';

@immutable
abstract class BaseService {
  const BaseService();

  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioError catch (exception) {
      throw await _getProcessedDioError(exception);
    } on ApiException {
      rethrow;
    } on FirebaseAuthException catch (exception) {
      throw _getFirebaseAuthException(exception);
    } on ApplicationException {
      rethrow;
    } catch (exception, stackTrace) {
      final error = exception.toString();
      log(
        error,
        name: 'BaseService Error',
        error: exception,
        stackTrace: stackTrace,
      );
      if (exception is String) throw ApplicationException(exception);

      throw ApplicationException(error);
    }
  }

  Future<ApiException> _getProcessedDioError(DioError exception) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return ApiException(
        message: getLocaleLocalizations().errorInternetConnection,
      );
    }

    final unknownApiException = ApiException(
      message: getLocaleLocalizations().serverErrorMessage,
    );

    try {
      final response = exception.response?.data;

      if (response == null) {
        return unknownApiException;
      }

      final apiError = BaseError.fromJson(response);

      return ApiException(
        statusCode: apiError.status,
        message: '${apiError.detail} [${apiError.message}]',
      );
    } catch (_) {
      return unknownApiException;
    }
  }

  AuthException _getFirebaseAuthException(FirebaseAuthException exception) {
    final code = exception.code;
    late AuthExceptionType exceptionType;
    switch (code) {
      case 'weak-password':
        exceptionType = AuthExceptionType.weakPassword;
        break;
      case 'email-already-in-use':
        exceptionType = AuthExceptionType.emailAlreadyInUse;
        break;
      case 'user-not-found':
        exceptionType = AuthExceptionType.userNotFound;
        break;
      case 'wrong-password':
        exceptionType = AuthExceptionType.wrongPassword;
        break;
      default:
        exceptionType = AuthExceptionType.none;
        break;
    }
    return AuthException(exceptionType: exceptionType);
  }
}
