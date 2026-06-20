import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';
import 'package:technicaltest/modules/home/widgets/bottomsheets.dart';

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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            showDragHandle: true,
            builder: (currentContext) {
              return bottomsheet(context, currentContext);
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
              Text(
                "Task Due Today",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                margin: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("test"),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "List of tasks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {},
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
                child: Obx(
                  () => Column(
                    children: controller.mockTaskData.reversed.take(5).map((
                      data,
                    ) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              controller.convertStatusEnumToString(
                                    data["status"],
                                  ) ==
                                  "Pending"
                              ? Colors.grey
                              : controller.convertStatusEnumToString(
                                      data["status"],
                                    ) ==
                                    "Done"
                              ? Colors.green
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              data["title"] ?? "Unknown Task",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              controller.convertStatusEnumToString(
                                data["status"],
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
