import 'package:get/get.dart';
import 'package:technicaltest/core/repository/auth_repository.dart';
import 'package:technicaltest/core/repository/task_repository.dart';
import 'package:technicaltest/core/services/firebase/auth_service.dart';
import 'package:technicaltest/core/services/firebase/firestore_service.dart';

Future<void> initDeps() async {
  final firestoreService = await Get.putAsync(() => FirestoreService().init());
  final authService = await Get.putAsync(() => AuthService().init());

  final TaskRepository taskRepository = TaskRepository(firestoreService: firestoreService);
  Get.put<TaskRepository>(taskRepository);
  
  final AuthRepository authRepository = AuthRepository(authService: authService);
  Get.put<AuthRepository>(authRepository);
}