import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

abstract class FirebaseConfig {
  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      name: 'gm',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
