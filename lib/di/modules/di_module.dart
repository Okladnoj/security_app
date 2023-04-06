import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/firebase/firebase_utils/firestore_path.dart';
import '../../utils/env_utils/env_utils.dart';

@module
@immutable
abstract class DiModule {
  @lazySingleton
  FirebaseApp get app => Firebase.app();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  GoogleSignIn get googleSignIn => GoogleSignIn();

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore firebaseFirestore(FirebaseApp app) {
    final firestore = FirebaseFirestore.instanceFor(app: app);
    if (useEmulator) {
      firestore.useFirestoreEmulator('localhost', 8080);
    }
    return firestore;
  }

  @lazySingleton
  FirestorePaths get paths => const FirestorePaths();
}
