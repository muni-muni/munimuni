import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/routes/pages/page.dart' as page;
import 'package:munimuni/routes/workspaces/Workspace.dart';
import 'package:munimuni/isar_service.dart';

bool hasAccount = true;
bool hasGuestCode = true;
final service = IsarService();

void createWorkspace() async {
  await service.createWorkspace();
  print("Done creating workspace");
}

void createPage() {
  print("will add page soon");
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        redirect: (context, state) async {
          if (!hasAccount && !hasGuestCode) {
            return '/createAccount';
          }
          if (!(await service.hasWorkspace())) {
            createWorkspace();
            createPage();
          } else {
            print("Already has workspace");
          }
          return '/page';
        }),
    GoRoute(
        path: '/page',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const page.PageView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child))),
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
        path: '/createAccount',
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