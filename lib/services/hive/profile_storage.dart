import 'package:injectable/injectable.dart';

import '../../config/hive/hive_base_repository.dart';
import '../../models/user/user_model.dart';

@injectable
class ProfileStorage extends HiveBaseRepository<UserModel> {
  Future<UserModel?> getProfile() async {
    final box = await baseBox;
    return box.get(key);
  }

  Future<void> saveProfile(UserModel value) async {
    final box = await baseBox;
    await box.put(key, value);
  }
}
