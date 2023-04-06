// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i18;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../api/dio/dio_api.dart' as _i4;
import '../api/interceptors/api_interceptors.dart' as _i16;
import '../api/retrofit/user/user_api.dart' as _i21;
import '../bloc/app/app_cubit.dart' as _i23;
import '../bloc/app_controller/app_controller_cubit.dart' as _i22;
import '../bloc/auth/auth_cubit.dart' as _i24;
import '../config/hive/database_manager.dart' as _i10;
import '../routes/module/route_module.dart' as _i26;
import '../routes/router.dart' as _i3;
import '../services/api/auth/auth_service.dart' as _i17;
import '../services/api/token/token_service.dart' as _i14;
import '../services/firebase/firebase_utils/firestore_path.dart' as _i8;
import '../services/firebase/users_firebase_service.dart' as _i15;
import '../services/hive/profile_storage.dart' as _i11;
import '../services/storage/fonts/fonts_service.dart' as _i19;
import '../services/storage/locale/locale_service.dart' as _i20;
import '../services/storage/theme/theme_service.dart' as _i13;
import 'modules/di_module.dart' as _i25;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final routeModule = _$RouteModule();
  final dioModule = _$DioModule();
  final diModule = _$DiModule();
  final userApiModule = _$UserApiModule();
  gh.lazySingleton<_i3.AppRouter>(() => routeModule.router());
  gh.lazySingleton<_i4.EmptyDio>(() => dioModule.emptyClient());
  gh.lazySingleton<_i5.FirebaseApp>(() => diModule.app);
  gh.factory<_i6.FirebaseAuth>(() => diModule.firebaseAuth);
  gh.lazySingleton<_i7.FirebaseFirestore>(
      () => diModule.firebaseFirestore(gh<_i5.FirebaseApp>()));
  gh.lazySingleton<_i8.FirestorePaths>(() => diModule.paths);
  gh.factory<_i9.GoogleSignIn>(() => diModule.googleSignIn);
  gh.singleton<_i10.HiveManager>(_i10.HiveManager());
  gh.factory<_i11.ProfileStorage>(() => _i11.ProfileStorage());
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => diModule.prefs,
    preResolve: true,
  );
  gh.factory<_i13.ThemeService>(
      () => _i13.ThemeService(gh<_i12.SharedPreferences>()));
  gh.factory<_i14.TokenService>(() => _i14.TokenService());
  gh.lazySingleton<_i15.UsersFirebaseService>(() => _i15.UsersFirebaseService(
        gh<_i7.FirebaseFirestore>(),
        gh<_i8.FirestorePaths>(),
      ));
  gh.lazySingleton<_i16.ApiInterceptor>(
      () => _i16.ApiInterceptor(gh<_i14.TokenService>()));
  gh.lazySingleton<_i17.AuthService>(() => _i17.AuthService(
        gh<_i9.GoogleSignIn>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i18.Dio>(() => dioModule.client(gh<_i16.ApiInterceptor>()));
  gh.factory<_i19.FontsService>(
      () => _i19.FontsService(gh<_i12.SharedPreferences>()));
  gh.factory<_i20.LocaleService>(
      () => _i20.LocaleService(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i21.UserApi>(
      () => userApiModule.getInstance(gh<_i18.Dio>()));
  gh.factory<_i22.AppControllerCubit>(() => _i22.AppControllerCubit(
        gh<_i20.LocaleService>(),
        gh<_i13.ThemeService>(),
        gh<_i19.FontsService>(),
      ));
  gh.factory<_i23.AppCubit>(() => _i23.AppCubit(
        gh<_i17.AuthService>(),
        gh<_i10.HiveManager>(),
        gh<_i11.ProfileStorage>(),
        gh<_i15.UsersFirebaseService>(),
      ));
  gh.factory<_i24.AuthCubit>(() => _i24.AuthCubit(
        gh<_i17.AuthService>(),
        gh<_i11.ProfileStorage>(),
        gh<_i15.UsersFirebaseService>(),
      ));
  return getIt;
}

class _$DiModule extends _i25.DiModule {}

class _$UserApiModule extends _i21.UserApiModule {}

class _$DioModule extends _i4.DioModule {}

class _$RouteModule extends _i26.RouteModule {}
