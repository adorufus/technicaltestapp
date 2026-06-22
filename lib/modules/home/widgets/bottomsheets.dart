import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/core/models/task_data_model.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';

Widget bottomsheet(
  BuildContext context,
  BuildContext currentContext, {
  required bool isEdit,
  TaskModel? taskToEdit,
}) {
  HomeController homeController = Get.find<HomeController>();

  homeController.taskTitleController.text = isEdit ? taskToEdit!.title : "";
  homeController.taskNotesController.text = isEdit ? taskToEdit!.notes : "";

  return Container(
    height: 400,
    padding: EdgeInsets.all(20),
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        SizedBox(height: 30),
        Text("Create New Task", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        TextFormField(
          controller: homeController.taskTitleController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Task Name"),
          ),
        ),
        SizedBox(height: 25),
        TextFormField(
          controller: homeController.taskNotesController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Notes"),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () => DropdownButton<TaskStatus>(
              value: homeController.selectedStatus.value,
              items: [
                DropdownMenuItem<TaskStatus>(
                  value: TaskStatus.done,
                  child: Text(TaskStatus.done.name),
                ),
                DropdownMenuItem<TaskStatus>(
                  value: TaskStatus.onprogress,
                  child: Text(TaskStatus.onprogress.name),
                ),
                DropdownMenuItem<TaskStatus>(
                  value: TaskStatus.pending,
                  child: Text(TaskStatus.pending.name),
                ),
              ],
              onChanged: (taskStatus) {
                homeController.selectedStatus.value =
                    taskStatus ?? TaskStatus.pending;
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(currentContext).size.width,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith((_) {
                return Colors.blue;
              }),
              foregroundColor: WidgetStateColor.resolveWith((_) {
                return Colors.white;
              }),
            ),
            onPressed: () {
              if(isEdit) {
                homeController.updateTask(taskToEdit!);
                return;
              }

              homeController.addNewTask();
            },
            child: Text("Save"),
          ),
        ),
      ],
    ),
  );
}
