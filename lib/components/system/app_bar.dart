import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon:const Icon(Icons.menu_rounded),
        onPressed: () => {
          Scaffold.of(context).openDrawer()
        },
        ),);
  }
}
