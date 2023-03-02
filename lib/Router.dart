import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/routes/pages/Page.dart' as page;
import 'package:munimuni/routes/workspaces/Workspace.dart';


// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        if (1 + 1 == 2){
          return '/page';
        }
        else{
          return '/notes';
        }
      }
    ),
    GoRoute(
      path: '/page',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const page.PageView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child)
          )
    ),
    GoRoute(
        path: '/notes',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const page.PageView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child))),
    GoRoute(
        path: '/tasks',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const Workspace(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child))),
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