import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:technicaltest/core/repository/auth_repository.dart';
import 'package:technicaltest/core/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find<AuthRepository>();

  void onLogin() async {
    await authRepository.signIn();

    Get.toNamed(AppRoutes.home);
  }
}