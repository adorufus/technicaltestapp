import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/core/models/task_data_model.dart';
import 'package:technicaltest/core/routes/app_routes.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';
import 'package:technicaltest/modules/home/widgets/bottomsheets.dart';
import 'package:technicaltest/modules/home/widgets/task_list_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyActions: false,
        title: Text("Task Tracker App"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            showDragHandle: true,
            builder: (currentContext) {
              return bottomsheet(context, currentContext, isEdit: false);
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Ongoing Tasks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.fullTaskList, arguments: {
                        "status": TaskStatus.onprogress
                      });
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.streamedTaskList
                      .where(
                        (data) =>
                            data.status.label == "onprogress" ||
                            data.status.label == "On Progress",
                      )
                      .isEmpty) {
                    return const Center(child: Text("Tidak ada data"));
                  }

                  return taskListWidget(
                    context,
                    controller,
                    isFiltereByStatus: true,
                    status: TaskStatus.onprogress,
                  );
                }),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Finished Tasks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.fullTaskList, arguments: {
                        "status": TaskStatus.done
                      });
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    status: TaskStatus.done
                  );
                }),
              ),
              Row(
                children: [
                  Text(
                    "Pending Tasks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.fullTaskList, arguments: {
                        "status": TaskStatus.pending
                      });
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    status: TaskStatus.pending                   
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
