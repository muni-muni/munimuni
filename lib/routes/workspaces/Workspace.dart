import 'package:flutter/material.dart';
import 'package:munimuni/components/system/AppBar.dart';

class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(30),
        child: CustomAppBar(), 
      ),
    );
  }
}
