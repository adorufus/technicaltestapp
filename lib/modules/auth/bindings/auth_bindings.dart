import 'package:get/get.dart';
import 'package:technicaltest/modules/auth/controller/login_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}