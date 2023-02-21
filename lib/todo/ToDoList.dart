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

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          SizedBox(
            height:300,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];

                return Card(
                  color:Colors.white,
                  child:ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 24,vertical:8),                  
                    title: Text(
                      task.title,
                      maxLines: 2,
                      style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18)
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Future _addText() async {
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
        ListView(
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
                  onPressed: _addText,
                  child:const Icon(Icons.add_rounded),
                )
            ],),
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