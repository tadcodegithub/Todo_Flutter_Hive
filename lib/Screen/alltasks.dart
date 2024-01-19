import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoactivities/models/taskmodel.dart';
import 'package:intl/intl.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late Box<TaskModel> tasksBox;

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box('alltasksbox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /*
        ListView.builder(
            itemCount: tasksBox.length,
            itemBuilder: (context, index) {
              final task = tasksBox.getAt(index) as TaskModel;
              return Card(
                child: Column(children: [
                  Text(task.taskId.toString()),
                  Text(task.taskTitle.toString()),
                  Text(task.taskDiscription.toString()),
                ]),
              );
            })*/

          ListView.builder(
        itemCount: tasksBox.length,
        itemBuilder: (context, index) {
          final task = tasksBox.getAt(index) as TaskModel;
          int tasksBoxlength = tasksBox.length;
          print("current length$tasksBoxlength");
          if (tasksBox.length == 0) {
            return Text("no data");
          }
          return Card(
            color: Colors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: [
                    // Text(task.key),
                    Text(
                      "Title: " + task.taskTitle.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Task is " + (task.taskDiscription.toString())),
                    Text("Current task status:" +
                        (task.currentStatus.toString())),
                    const Divider(color: Colors.black),
                    Text("Task starting date: " +
                        (DateFormat('yyyy-MM-dd hh:mm:ss')
                            .format(task.startDate as DateTime))),
                    Text(
                        "Task estimated completed date: ${(DateFormat('yyyy-MM-dd hh:mm:ss').format(task.endDate as DateTime))}"),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text(
                        'Change task Status',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text(
                        'Delete Task',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        DeleteTask(tasksBox.getAt(index) as TaskModel);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void DeleteTask(TaskModel task) async {
    task.delete();
    setState(() {
      tasksBox = Hive.box('alltasksbox');
    });
  }
}
