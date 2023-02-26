
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({super.key});
//Still pending work

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar:AppBar(

           ),
          body: Container(),
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