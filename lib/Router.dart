import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:munimuni/routes/error.dart';
import 'package:munimuni/routes/pages/page.dart' as page;
import 'package:munimuni/models/Workspace.dart';
import 'package:munimuni/isar_service.dart';

bool hasAccount = true;
bool hasGuestCode = true;
final service = IsarService();

void createWorkspace() async {
  await service.createWorkspace();
  print("Done creating workspace");
}

Future<Workspace?> getWorkspace() async {
  return service.getWorkspace();
}

void createPage(Workspace workspace) {
  service.createPage(workspace);
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
          }
          var workspace = await getWorkspace();
          if (workspace == null) {
            print("Workspace is Null");
            return '/error';
          }
          var pages = workspace.pages;
          if (pages.isEmpty) {
            createPage(workspace);
          }
          var page = pages.first;
          if (page.uid != null) {
            final uid = page.uid ?? "";
            return '/page/$uid';
          } else {
            return '/page';
          }
        }),
    GoRoute(
        name: 'page',
        path: '/page/:pageId',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const page.PageView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child))),
    GoRoute(
        path: '/error',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const ErrorPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child))),
    GoRoute(
        path: '/createAccount',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: page.PageView(),
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