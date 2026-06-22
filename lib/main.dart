import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/core/di/inject.dart';
import 'package:technicaltest/core/routes/app_routes.dart';
import 'package:technicaltest/core/services/firebase/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseService.init();

  await initService();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}
