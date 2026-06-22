import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:technicaltest/modules/home/bindings/home_binding.dart';
import 'package:technicaltest/modules/home/home_screen.dart';
import 'package:technicaltest/modules/home/widgets/full_tasks_list.dart';

class AppRoutes {
  static String home = "/home";
  static String fullTaskList = "/full-task-list";

  static final pages = [
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
      name: fullTaskList,
      page: () => FullTasksList(),
      binding: HomeBinding(),
    ),
  ];
}
