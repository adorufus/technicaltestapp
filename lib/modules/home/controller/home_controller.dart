import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TaskStatus { pending, done, onprogress }

class HomeController extends GetxController {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskNotesController = TextEditingController();

  RxList<Map<String, dynamic>> mockTaskData = <Map<String, dynamic>>[
    {"title": "Task 1", "status": TaskStatus.pending},
    {"title": "Task 2", "status": TaskStatus.done},
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool validateInput(String? input) {
    if (input != null || input!.isNotEmpty) {
      return true;
    }

    return false;
  }

  void addNewTask() {
    if (validateInput(taskTitleController.text)) {
      mockTaskData.add(<String, dynamic>{
        "title": taskTitleController.text,
        "notes": taskNotesController.text,
        "status": TaskStatus.pending,
      });

      Get.back();
    }
  }

  void setStatus(int taskIndex, TaskStatus status) {
    mockTaskData[taskIndex] = {...mockTaskData[taskIndex], 'status': status};

    mockTaskData.refresh();
  }

  void setMockTaskData(List<Map<String, dynamic>> value) {
    mockTaskData.value = value;
  }

  String convertStatusEnumToString(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return "Pending";
      case TaskStatus.done:
        return "Done";
      case TaskStatus.onprogress:
        return "On Progress";
    }
  }
}
