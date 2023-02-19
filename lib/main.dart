
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
  List<String> text = ["test1", "test2", "test3"];
  
  Widget getTextWidgets(List<String> strings)
  {
    return Column(children: strings.map((item) => Text(item)).toList());
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
            body: Flex(
              direction: Axis.vertical,
              children:[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      width:100,
                      child: TextField(maxLength: 20,)
                    ),
                    FloatingActionButton(
                      child:const Icon(Icons.plus_one_outlined),
                      onPressed: () => {print("Helo world")}
                    )
                ],),
                getTextWidgets(text)
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

