import 'dart:async';
import 'dart:math';

import 'package:isar/isar.dart';
import 'package:munimuni/models/Block.dart';
import 'package:munimuni/models/Page.dart';
import 'package:munimuni/models/Workspace.dart';
import 'package:munimuni/models/User.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) {
  String output = String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  return output;
}

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<List<Block?>?> getBlocks(String? pageId) async {
    if (pageId == null) {
      return Future.value(null);
    }
    final isar = await db;
    final page = await isar.pages.filter().uidMatches(pageId).findFirst();
    if (page == null){
      return null;
    }
    if (page.blocks.toList().isEmpty) {
      return null;
    } else {
      return page.blocks.toList();
    }
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PageSchema, WorkspaceSchema, BlockSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
