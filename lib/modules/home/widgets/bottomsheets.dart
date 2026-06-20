import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';

Widget bottomsheet(BuildContext context, BuildContext currentContext) {
  HomeController homeController = Get.find<HomeController>();

  return Container(
    height: 350,
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
          width: MediaQuery.of(currentContext).size.width,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith((_) {
                return Colors.red;
              }),
              foregroundColor: WidgetStateColor.resolveWith((_) {
                return Colors.white;
              }),
            ),
            onPressed: () {
              homeController.addNewTask();
            },
            child: Text("Save"),
          ),
        ),
      ],
    ),
  );
}
