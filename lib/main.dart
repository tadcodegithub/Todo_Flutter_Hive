import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoactivities/Screen/addnewtask.dart';
import 'package:todoactivities/Screen/alltasks.dart';
import 'package:todoactivities/Screen/home.dart';
import 'package:todoactivities/Screen/notification.dart';
import 'package:todoactivities/sidemenu/navbar.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  final pages = [
    const Home(),
    const AllTasks(),
    const AddNewTask(),
    const TaskNotification(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text("TODO"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: Colors.greenAccent[400],
        ),
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: const Color.fromARGB(255, 150, 140, 0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.tealAccent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 15,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            print(value);
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.all_out), label: "AllTasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: "Add New Task"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification")
          ],
        ));
  }
}
