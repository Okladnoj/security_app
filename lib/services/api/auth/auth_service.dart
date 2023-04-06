import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../base/service/base_service.dart';
import '../../../models/user/user_model.dart';

@lazySingleton
class AuthService extends BaseService {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  const AuthService(this._googleSignIn, this._firebaseAuth);

  Future<UserModel?> signInGoogle() async {
    return makeErrorParsedCall(() async {
      final result = await _googleSignIn.signIn();

      if (result == null) return null;
      final googleAuth = await result.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      final uid = user.user?.uid;
      final name = user.user?.displayName;
      final avatar = user.user?.photoURL;
      final email = user.user?.email;

      if (name == null) return null;
      if (avatar == null) return null;
      if (email == null) return null;

      return UserModel(uid: uid, name: name, avatar: avatar, email: email);
    });
  }

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return makeErrorParsedCall(() async {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = result.user?.uid;
      final name = result.user?.displayName;
      final avatar = result.user?.photoURL;

      if (name == null) return null;
      if (avatar == null) return null;

      return UserModel(uid: id, name: name, avatar: avatar, email: email);
    });
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return makeErrorParsedCall(() async {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = result.user?.uid;
      final name = result.user?.displayName;
      final avatar = result.user?.photoURL;

      if (name == null) return null;
      if (avatar == null) return null;

      return UserModel(uid: id, name: name, avatar: avatar, email: email);
    });
  }

  Future<UserModel?> signInAnonymously() async {
    return makeErrorParsedCall(() async {
      final result = await _firebaseAuth.signInAnonymously();

      final id = result.user?.uid;

      return UserModel(uid: id, name: 'Anonymous', avatar: '', email: '');
    });
  }

  Future<void> signOut() async {
    return makeErrorParsedCall(_firebaseAuth.signOut);
  }
}
