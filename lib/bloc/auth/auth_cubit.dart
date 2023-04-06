import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../services/api/auth/auth_service.dart';
import '../../services/firebase/users_firebase_service.dart';
import '../../services/hive/profile_storage.dart';
import 'package:security_app/models/user/user_model.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends BaseCubit<AuthState> {
  final AuthService _authService;
  final ProfileStorage _userModelStorage;
  final UsersFirebaseService _firebaseService;

  AuthCubit(
    this._authService,
    this._userModelStorage,
    this._firebaseService,
  ) : super(const AuthState());

  @override
  void handleError(String message) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: message,
    ));
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    final user = await _userModelStorage.getProfile();
    emit(state.copyWith(
      status: StateStatus.loaded,
      auth: user != null,
    ));
  }

  Future<void> signInGoogle() async {
    emit(state.copyWith(status: StateStatus.refresh));
    final user = await performSafeAction(_authService.signInGoogle);
    emit(state.copyWith(status: StateStatus.loaded));
    if (user == null) return;
    await _saveUser(user);
  }

  Future<void> signInAnonymously() async {
    emit(state.copyWith(status: StateStatus.refresh));
    final user = await performSafeAction(_authService.signInAnonymously);
    emit(state.copyWith(status: StateStatus.loaded));
    if (user == null) return;
    await _saveUser(user);
  }

  Future<void> _saveUser(UserModel user) async {
    emit(state.copyWith(status: StateStatus.refresh));
    await _userModelStorage.saveProfile(user);
    await _firebaseService.saveProfile(user);
    emit(state.copyWith(status: StateStatus.refresh, auth: true));
  }
}
