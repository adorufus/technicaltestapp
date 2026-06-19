import 'package:flutter/material.dart';
import 'package:technicaltest/core/home/widgets/bottomsheets.dart';

class HomeScreen extends StatelessWidget {
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
              Text("Task Due Today", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
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
                    child: Text("See All", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [{
                    "title": "Task 1",
                    "status": "Pending"
                  }, {
                    "title": "Task 2",
                    "status": "Done"
                  }, 
                  {
                    "title": "Task 3",
                    "status": "On Progress"
                  }, 
                  {
                    "title": "Task 4",
                    "status": "Pending"
                  }].map((data) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: data["status"] == "Pending" ? Colors.grey : data["status"] == "Done" ? Colors.green : Colors.blue,
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
                            data["status"] ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
