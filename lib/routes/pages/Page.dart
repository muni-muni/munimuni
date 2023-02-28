import 'package:flutter/material.dart';
import 'package:munimuni/components/system/AppBar.dart';

class PageView extends StatefulWidget {
  const PageView({super.key});

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {
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
