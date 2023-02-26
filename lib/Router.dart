import 'package:go_router/go_router.dart';
import 'package:munimuni/tasks/Tasks.dart';
// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Task(),
    ),
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