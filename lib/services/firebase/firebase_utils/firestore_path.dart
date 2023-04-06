class FirestorePaths {
  const FirestorePaths();

  /// Collections
  String get usersCollection => 'users';
  String get templateCollection => 'template';

  /// user/ fields
  String get userId => 'uid';

  FirestoreUserPaths user(String userId) => FirestoreUserPaths._(userId, this);

  FirestoreTemplatePaths template(String templateId) {
    return FirestoreTemplatePaths._(templateId, this);
  }
}

class FirestoreUserPaths {
  final FirestorePaths paths;
  final String userId;

  const FirestoreUserPaths._(this.userId, this.paths);

  String get userDoc => '${paths.usersCollection}/$userId';
}

class FirestoreTemplatePaths {
  final FirestorePaths paths;
  final String templateId;

  FirestoreTemplatePaths._(this.templateId, this.paths);

  String get templateDoc => '${paths.templateCollection}/$templateId';
}
