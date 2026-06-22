import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/core/models/task_data_model.dart';
import 'package:technicaltest/core/repository/task_repository.dart';

class HomeController extends GetxController {

  final TaskRepository taskRepository = Get.find<TaskRepository>();

  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskNotesController = TextEditingController();

  RxList<Map<String, dynamic>> mockTaskData = <Map<String, dynamic>>[
    {"title": "Task 1", "notes": "notes 1", "status": TaskStatus.pending},
    {"title": "Task 2", "notes": "notes 2", "status": TaskStatus.done},
  ].obs;

  RxList<TaskModel> realTaskData = RxList.empty();
  Rx<TaskStatus> selectedStatus = Rx(TaskStatus.pending);
  var streamedTaskList = <TaskModel>[].obs;
  var isLoading = true.obs;

  var currentTaskStatusPage = TaskStatus.pending;

  @override
  void onInit() async {
    super.onInit();

    await getTaskData();
    streamTaskData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void streamTaskData() {
    streamedTaskList.bindStream(taskRepository.streamTasks());

    ever(streamedTaskList, (_) => isLoading.value = false);
  }

  Future getTaskData() async {
    await taskRepository.getTasks().then((taskData) {
      print(taskData);

      realTaskData.value = taskData;
    });
  }

  bool validateInput(String? input) {
    if (input != null || input!.isNotEmpty) {
      return true;
    }

    return false;
  }

  void addNewTask() {
    if (validateInput(taskTitleController.text)) {
      // mockTaskData.add(<String, dynamic>{
      //   "title": taskTitleController.text,
      //   "notes": taskNotesController.text,
      //   "status": TaskStatus.pending,
      // });

      final newTask = TaskModel(id: '', title: taskTitleController.text, notes: taskNotesController.text, status: selectedStatus.value);

      taskRepository.addTask(newTask);

      getTaskData();

      Get.back();
    }
  }

  void updateTask(TaskModel currentTaskData) {
    final updatedTask = currentTaskData.copyWith(
      title: taskTitleController.text,
      notes: taskNotesController.text,
      status: selectedStatus.value
    );

    taskRepository.updateTask(updatedTask);

    Get.back();
  }

  void deleteTask(String taskId) {
    taskRepository.deleteTask(taskId);
  }

  void setStatus(int taskIndex, TaskStatus status) {
    mockTaskData[taskIndex] = {...mockTaskData[taskIndex], 'status': status};

    mockTaskData.refresh();
  }

  void setMockTaskData(List<Map<String, dynamic>> value) {
    mockTaskData.value = value;
  }
}
