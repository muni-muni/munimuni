import 'package:flutter/material.dart';
import 'package:munimuni/components/block/block.dart';
import 'package:munimuni/models/Block.dart' as modelBlock;

import 'package:munimuni/components/system/app_bar.dart';
import 'package:munimuni/components/system/drawer_container.dart';
import 'package:munimuni/isar/page.dart';

class PageView extends StatefulWidget {
  final String? pageId;

  const PageView({super.key, this.pageId});

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {
  final service = IsarService();

  List<modelBlock.Block?>? _blocks = [];
  // Add value to blocks
  // service.getBlocks(widget.pageId!);

  Future<List<modelBlock.Block?>?> getBlocksFromIsar() async {
    _blocks = await service.getBlocks(widget.pageId);
    print("done");
    print(_blocks);
  }

  @override
  void initState() {
    getBlocksFromIsar();
    super.initState();
  }

  Widget? getBlocks(List<modelBlock.Block?>? blocks) {
    if (blocks == null) {
      return null;
    }
    return ListView.builder(
      itemCount: blocks.length,
      itemBuilder: (context, index) {
        return Block();
      },
    );
  }

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
            Expanded(
              child: getBlocks(_blocks) ?? Text("No wdgets yet"),
            ),
            IconButton(
              icon: Icon(Icons.plus_one),
              onPressed: () async {
                await service.createBlock(widget.pageId);
                final temp = await service.getBlocks(widget.pageId);
                setState(() {
                  _blocks = temp;
                });
              },
            )
          ],
        ));
  }
}
