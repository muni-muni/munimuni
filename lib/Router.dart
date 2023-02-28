import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/tasks/Tasks.dart';
import 'package:munimuni/notes/Notes.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const Task(),
        transitionsBuilder: (context,animation,secondaryAnimation, child) => 
          FadeTransition(opacity:animation, child:child)
      )
    ),
    GoRoute(
      path: '/notes',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const Note(),
        transitionsBuilder: (context,animation,secondaryAnimation, child) => 
          FadeTransition(opacity:animation, child:child)
      )
    )
  ],
);

/**
 *
 * 

      
 * routes: <String, WidgetBuilder> {
        '/': (BuildContext context) {
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
        },
        '/projects': (BuildContext context ){
          return Scaffold(
            appBar: AppBar(
              title:const Text("test home")
            ),    
          );
        } */