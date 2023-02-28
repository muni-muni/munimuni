import 'package:flutter/material.dart';
import 'package:munimuni/components/system/BottomNavigationBar.dart';
import 'package:munimuni/routes/notes/NoteList.dart';
import 'package:munimuni/components/system/AppBar.dart';
class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child:CustomAppBar()),
      body: NoteList(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

/**
 * 
 * import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/todo/ToDoList.dart';
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
          bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cases),
                  label: 'Projects'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile'
                )
              ]
            ),
          );
  }
}
 */