import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/routes/tasks/ToDoList.dart';
import 'package:munimuni/components/BottomNavigationBar.dart';
import 'package:munimuni/components/AppBar.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40), child: CustomAppBar()),
        // CustomAppBar(),
        body: ToDoList(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
