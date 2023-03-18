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
      backgroundColor: Colors.transparent,
      elevation:0,
      leading: IconButton(
        icon:const Icon(Icons.menu_rounded,color: Colors.black,),
        onPressed: () => {
          Scaffold.of(context).openDrawer()
        },
        ),
      );
  }
}
