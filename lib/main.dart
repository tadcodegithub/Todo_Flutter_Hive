import 'package:flutter/material.dart';
import 'package:todoactivities/Screen/addnewtask.dart';
import 'package:todoactivities/Screen/alltasks.dart';
import 'package:todoactivities/Screen/home.dart';
import 'package:todoactivities/Screen/notification.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int index = 0;
  final pages = [
    const Home(),
    const AllTasks(),
    const AddNewTask(),
    const TaskNotification(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pages[0]);
  }
}
