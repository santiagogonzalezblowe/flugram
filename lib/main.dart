import 'package:firebase_core/firebase_core.dart';
import 'package:flugram/app/logic/app_blocs_provider.dart';
import 'package:flugram/app/repositories/app_repositories_provider.dart';
import 'package:flugram/app/repositories/app_services_provider.dart';
import 'package:flugram/firebase_options.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const AppServicesProvider(
      child: AppRepositoriesProvider(
        child: AppBlocsProvider(
          child: MyApp(),
        ),
      ),
    ),
  );
}
