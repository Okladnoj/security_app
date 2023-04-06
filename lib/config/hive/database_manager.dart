import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart';
import '../../models/user/user_model.dart';
import '../../services/hive/profile_storage.dart';
import 'hive_base_repository.dart';

@singleton
class HiveManager {
  static const idUserModel = 0;

  static Future<void> initDB() async {
    await Hive.initFlutter();

    _registerAdapters();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(UserModelAdapter());
  }

  Future<void> dropDB() async {
    List<HiveBaseRepository> repos = [
      locator<ProfileStorage>(),
    ];

    for (final repo in repos) {
      await Hive.deleteBoxFromDisk(repo.boxName);
    }
  }
}
