import 'package:flutter/material.dart';

class DrawerChild extends StatefulWidget {
  const DrawerChild({super.key});

  @override
  State<DrawerChild> createState() => _DrawerChildState();
}

class _DrawerChildState extends State<DrawerChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 200,
            child: Text("MUNIMUNI",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
          ),
          Row(
            children: [
              const Text(
                "Workspaces",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500
                )
              ),
              const SizedBox(width: 50),
              IconButton(
                onPressed: () => {print("hello world")},
                icon: const Icon(Icons.my_library_add_outlined)
              )
            ],
          ),
          Row(
            children: [
              Text("Pages",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              const SizedBox(width: 50),
              IconButton(
                  onPressed: () => {print("hello world")},
                  icon: const Icon(Icons.my_library_add_outlined))
            ],
          ),
        ]));
  }
}
