import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

import '../../config/hive/database_manager.dart';
import '../../di/di.dart';

part 'user_model.freezed.dart';
part 'user_model.hive.dart';
part 'user_model.g.dart';

@immutable
@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @HiveType(typeId: HiveManager.idUserModel)
  const factory UserModel({
    @JsonKey(name: 'uid') @HiveField(0) String? uid,
    @JsonKey(name: 'name') @Default('') @HiveField(1) String name,
    @JsonKey(name: 'avatar') @Default('') @HiveField(2) String avatar,
    @JsonKey(name: 'email') @Default('') @HiveField(3) String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  DocumentReference<Map<String, dynamic>> get userDocRef {
    return locator<FirebaseFirestore>().doc('$uid');
  }
}
