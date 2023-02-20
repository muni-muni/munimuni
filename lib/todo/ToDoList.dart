import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> _text = ["test1", "test2", "test3"];
  Widget getTextWidgets(List<String> strings)
  {
    return Column(children: strings.map((item) => 
      Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.green[500],
          border: Border.all(width:1, color: Colors.grey),
          borderRadius: BorderRadius.circular(12)    
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child:
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Text(item,
            style: TextStyle(
              fontSize: 20,
              color:Colors.grey[900],              
            )
          )
        )
      )
    )).toList());
  }  
  void _addText(){
    setState(() {
      _text.add(_inputTaskController.text);
    });
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
            getTextWidgets(_text)
          ]
        )
      )
    )
      ;
  }
}