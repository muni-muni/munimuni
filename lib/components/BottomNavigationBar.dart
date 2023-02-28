import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.push('/'),
        ), 
        label: 'Home',
        ),
      BottomNavigationBarItem(
        icon: IconButton(
          icon: const Icon(Icons.note_add_rounded),
          onPressed: () => context.push('/notes'),
        ), 
        label: 'Note',
        ),
      BottomNavigationBarItem(icon: Icon(Icons.cases), label: 'Projects')
    ]);
  }
}
