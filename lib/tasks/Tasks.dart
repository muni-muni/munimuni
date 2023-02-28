import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/tasks/ToDoList.dart';
import 'package:munimuni/components/BottomNavigationBar.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar:AppBar(
           ),
          body: const ToDoList(), 
          bottomNavigationBar: const CustomBottomNavBar()
          );
  }
}