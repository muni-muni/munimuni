import 'package:flutter/material.dart';
import 'package:munimuni/components/block/block.dart';
import 'package:munimuni/components/system/app_bar.dart';
import 'package:munimuni/components/system/drawer_container.dart';

class PageView extends StatelessWidget {
  final String? pageId;

  const PageView({super.key, this.pageId});

  @override
  Widget build(BuildContext context) {
    print(this.pageId);
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
            Block(),
            Block(),
          ],
        ));
  }
}
