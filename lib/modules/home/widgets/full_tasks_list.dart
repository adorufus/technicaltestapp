import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';
import 'package:technicaltest/modules/home/widgets/task_list_widget.dart';

class FullTasksList extends GetView<HomeController> {
  const FullTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Tasks")),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.streamedTaskList.isEmpty) {
              return const Center(child: Text("Tidak ada data"));
            }

            return taskListWidget(
              context,
              controller,
              isFiltereByStatus: true,
              limitList: false,
              status: Get.arguments['status'],
            );
          }),
        ),
      ),
    );
  }
}
