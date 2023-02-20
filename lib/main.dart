
import 'package:flutter/material.dart';
import 'package:munimuni/todo/ToDoList.dart';
//Goal for today:
/// 1. Create a todo-list
/// 2. Save data in browser/local cache
///

class MuniMuni extends StatefulWidget {
  const MuniMuni({super.key});

  @override
  State<MuniMuni> createState() => _MuniMuniState();
}

class _MuniMuniState extends State<MuniMuni> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) {
          return const ToDoList();
        },
        '/projects': (BuildContext context ){
          return Scaffold(
            appBar: AppBar(
              title:const Text("test home")
            ),
            
          );
        }
      }
    );
  }
}
void main() {
  runApp(const MuniMuni());
}

