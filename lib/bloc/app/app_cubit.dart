import 'dart:async';

import 'package:translit/translit.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/bloc/base_cubit.dart';
import '../../config/hive/database_manager.dart';
import '../../models/template/template_model.dart';
import '../../models/user/user_model.dart';
import '../../services/api/auth/auth_service.dart';
import '../../services/firebase/users_firebase_service.dart';
import '../../services/hive/profile_storage.dart';

part 'app_state.dart';

@injectable
class AppCubit extends BaseCubit<AppState> {
  final AuthService _authService;
  final HiveManager _hiveManager;
  final ProfileStorage _userModelStorage;
  final UsersFirebaseService _usersFirebaseService;

  final _searchController = BehaviorSubject<String>();

  AppCubit(
    this._authService,
    this._hiveManager,
    this._userModelStorage,
    this._usersFirebaseService,
  ) : super(const AppState()) {
    _searchController.stream
        .debounceTime(const Duration(milliseconds: 50))
        .distinct()
        .listen(_findPosts);
  }

  @override
  void handleError(String message) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: message,
    ));
  }

  Future<void> init(bool login) async {
    final profile = await _userModelStorage.getProfile();
    emit(state.copyWith(
      status: StateStatus.loaded,
      login: login,
      profile: profile,
      templates: await _usersFirebaseService.getTemplate(),
    ));
  }

  Future<void> onSearch(String search) async {
    _searchController.add(search);
  }

  Future<void> logOut() async {
    await performSafeAction(() async {
      emit(state.copyWith(status: StateStatus.refresh));

      await _authService.signOut();
      await _hiveManager.dropDB();

      emit(state.copyWith(
        status: StateStatus.loaded,
        login: false,
      ));
    });
  }

  void _findPosts(String search) {
    final translit = Translit();
    final searchTranslit = translit.toTranslit(source: search);
    final searched = state.templates.where((admin) {
      final nameTranslit = translit.toTranslit(source: admin.name);
      final shapeTranslit = translit.toTranslit(source: admin.shape.name);

      return [
        nameTranslit,
        shapeTranslit,
      ].join('/').toLowerCase().contains(searchTranslit.toLowerCase());
    }).toList();
    emit(state.copyWith(searched: searched));
  }
}
