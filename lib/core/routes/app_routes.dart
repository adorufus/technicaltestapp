import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:technicaltest/modules/home/bindings/home_binding.dart';
import 'package:technicaltest/modules/home/home_screen.dart';

class AppRoutes {
  static String home = "/home";

  static final pages = [
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
  ];
}
