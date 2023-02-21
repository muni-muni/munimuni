import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:munimuni/todo/ToDoBoxes.dart';

import '../models/task.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  late BoxCollection collection; 
  late CollectionBox tasksBox; 


  @override 
  void dispose(){
    Hive.close;
    super.dispose();
  }
  Widget buildContent(List<Task> tasks){
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No expenses yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {

      return Flexible(
        child:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final task = tasks[index];
            return Column(
              children:[
                ListTile(
                  leading: Icon(Icons.checklist_rounded),
                  title:Text(task.title),
                  subtitle:Text(task.deadline.toString())
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    const SizedBox(width:5),
                    TextButton(
                      onPressed: () => {_removeTask(task)},
                      child: const Text('delete'),
                    ),
                    TextButton(
                      onPressed: (){print("Work on deleteing the actual tasks mao");},
                      child: const Text('finished'),),
                    ],
                )
              ] 
            );
          },
        )
      );
    }
  }

  Future _removeTask(Task task) async {
    final taskBox = ToDoBoxes.getTasks();
    taskBox.delete(task.key);
  }
  Future _addTask() async {
    final task = Task()
    ..title = _inputTaskController.text
    ..deadline = DateTime(2023,2,23);


    final taskBox = ToDoBoxes.getTasks();
    taskBox.add(task);
  }

  final _inputTaskController = TextEditingController();  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(
        Column(
          children:[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextField(
                    controller:  _inputTaskController,
                  )
                ),
                ElevatedButton(
                  onPressed: _addTask,
                  child:const Icon(Icons.add_rounded),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: ToDoBoxes.getTasks().listenable(),
              builder: (BuildContext context, box, _) {
                final tasks = box.values.toList().cast<Task>();
                return buildContent(tasks);
              }
             )
          ]
        )
      )
    )
      ;
  }
}