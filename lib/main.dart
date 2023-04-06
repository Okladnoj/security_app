import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'config/firebase/firebase_config.dart';
import 'bloc/app_controller/app_controller_cubit.dart';
import 'config/hive/database_manager.dart';
import 'di/di.dart';
import 'config/firebase/firebase_options.dart';
import 'security_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager.initDB();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies(const Environment(Environment.dev));
  await FirebaseConfig.initFirebase();

  runApp(const NameApp());
}

class NameApp extends StatelessWidget {
  const NameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppControllerCubit>(
      create: (_) => locator()..init(),
      child: SecurityApp(router: locator()),
    );
  }
}
