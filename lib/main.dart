
import 'package:flutter/material.dart';
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
  List<String> _text = ["test1", "test2", "test3"];
  
  void _addText(){
    setState(() {
      _text.add(_inputTaskController.text);
    });
  }

  final _inputTaskController = TextEditingController();
  @override

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home')
            ),
            body: ListView(
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
              ]),
          );
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

