import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../base/service/base_service.dart';
import '../../models/template/template_model.dart';
import '../../utils/firebase_utils.dart';
import '../../models/user/user_model.dart';
import 'firebase_utils/firestore_path.dart';

@lazySingleton
class UsersFirebaseService extends BaseService {
  final FirebaseFirestore _firestore;
  final FirestorePaths _path;

  const UsersFirebaseService(
    this._firestore,
    this._path,
  );

  Future<List<UserModel>> getUsers() async {
    return await makeErrorParsedCall(() async {
      final usersSnapshots = await //
          _firestore.collection(_path.usersCollection).get();

      final users = usersSnapshots.getMapped(_getUserModel);

      return users;
    });
  }

  Future<List<TemplateModel>> getTemplate() async {
    return await makeErrorParsedCall(() async {
      final usersSnapshots = await //
          _firestore.collection(_path.templateCollection).get();

      final users = usersSnapshots.getMapped(_getTemplateModel);

      return users;
    });
  }

  Future<void> saveProfile(UserModel user) async {
    return await makeErrorParsedCall(() async {
      final id = user.uid ?? '';

      final query = _firestore.collection(_path.usersCollection).where(
            _path.userId,
            isEqualTo: id,
          );
      final docs = await query.count().get();
      if (docs.count != 0) return;

      final doc = _firestore.collection(_path.usersCollection).doc(id);
      doc.set(user.toJson());
    });
  }

  UserModel _getUserModel(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    return UserModel.fromJson(snapshot.getMapped());
  }

  TemplateModel _getTemplateModel(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    return TemplateModel.fromJson(snapshot.getMapped());
  }
}
