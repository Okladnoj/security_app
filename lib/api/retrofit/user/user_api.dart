import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/user/user_model.dart';

part 'user_api.g.dart';

@module
abstract class UserApiModule {
  @lazySingleton
  UserApi getInstance(Dio dio) => UserApi(dio);
}

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('/user')
  Future<UserModel> getUser();
}
