import 'package:flutter/material.dart';
import 'package:munimuni/components/block/block.dart';
import 'package:munimuni/components/system/app_bar.dart';
import 'package:munimuni/components/system/drawer_container.dart';

class PageView extends StatefulWidget {
  const PageView({super.key});

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: CustomAppBar(),
        ),
        drawer: const Drawer(
          child: DrawerChild(),
        ),
        body: Column(
          children: [
            Block(),
          ],
        ));
  }
}
