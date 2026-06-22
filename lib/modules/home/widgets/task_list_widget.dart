import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:technicaltest/core/models/task_data_model.dart';
import 'package:technicaltest/modules/home/controller/home_controller.dart';
import 'package:technicaltest/modules/home/widgets/bottomsheets.dart';

Widget taskListWidget(BuildContext context, HomeController controller, {bool limitList = true, bool isFiltereByStatus = false, TaskStatus? status}) {

  var allDataWithoutFiltering = controller.streamedTaskList.reversed;
  var dataFilteredByStatus = allDataWithoutFiltering.where((data) =>  data.status == status);

  var theData = isFiltereByStatus ? dataFilteredByStatus : allDataWithoutFiltering;

  if(limitList) {
     theData = theData.take(5);
  }

  return Column(
    children: theData.map((data) {
          return Slidable(
            key: ValueKey(data.id),
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    controller.deleteTask(data.id);
                  },
                  icon: Icons.delete,
                  label: "Delete",
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    showModalBottomSheet(
                      context: context,
                      builder: (currentContext) {
                        return bottomsheet(
                          context,
                          currentContext,
                          isEdit: true,
                          taskToEdit: data,
                        );
                      },
                    );
                  },
                  label: "Edit",
                  icon: Icons.edit,
                  backgroundColor: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),

            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: data.status.label == "Pending"
                    ? Colors.grey
                    : data.status.label == "Done"
                    ? Colors.green
                    : Colors.blue,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Text(data.title, style: TextStyle(color: Colors.white)),
                  Expanded(child: SizedBox()),
                  Text(
                    data.status.label,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        })
        .toList(),
  );
}
