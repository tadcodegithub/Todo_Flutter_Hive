import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoactivities/models/taskmodel.dart';
import 'package:intl/intl.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _key = GlobalKey<FormState>();
  int taskId = 0;
  String? taskTitle;
  String? taskDiscription;
  String? currentStatus;
  late Box<TaskModel> tasksBox;
  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box('alltasksbox');
  }

  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();
  DateTime? choose = DateTime.now();
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        choose = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Tasks"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Id",
                        helperText: "Input task id",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        taskId = int.parse(value.toString());
                      },
                    ),*/
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "Task Title",
                        helperText: "Input Task Title",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        taskTitle = value.toString();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: "Task Discription",
                        helperText:
                            "Input the detail discription of the above task",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        taskDiscription = value.toString();
                      },
                    ),
                    TextButton.icon(
                      label: const Text("Choose Start date"),
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        final DateTime? selectedtime = await showDatePicker(
                            context: context,
                            initialDate: startDate,
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101));
                        setState(() {
                          startDate = selectedtime;
                        });
                      },
                    ),
                    Text(
                        "Start date(YYYY/MM/DD)=${DateFormat('yyyy-MM-dd hh:mm:ss').format(startDate as DateTime)}"),
                    TextButton.icon(
                      label: const Text("Choose End date"),
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        final DateTime? selectedtime = await showDatePicker(
                            context: context,
                            initialDate: startDate,
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101));
                        setState(() {
                          endDate = selectedtime;
                        });
                      },
                    ),
                    Text(
                        "End date(YYYY/MM/DD)=${DateFormat('yyyy-MM-dd hh:mm:ss').format(endDate as DateTime)}"),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          saveTasks();
                        },
                        label: const Text("Save"),
                        icon: const Icon(Icons.save),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  Future<dynamic> getselectedTime() async {
    final DateTime? selectedtime = await showDatePicker(
        context: context,
        initialDate: startDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    return selectedtime;
  }

  void saveTasks() {
    final isvalid = _key.currentState?.validate();
    if (isvalid != null && isvalid) {
      _key.currentState?.save();
      tasksBox.add(TaskModel(
        //  taskId: taskId,
        taskTitle: taskTitle,
        taskDiscription: taskDiscription,
        currentStatus: 'started',
        startDate: startDate,
        endDate: endDate,
      ));
    }
  }
}
