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
  Future<bool> hasUser() async {
    final isar = await db;
    return await isar.users.count() > 0? true:false;
  }
  Future<bool> hasWorkspace() async {
    final isar = await db;
    int count = await isar.workspaces.count();
    if (count > 0) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<void> createPage(Workspace workspace) async {
    final isar = await db;
    final page = Page()
      ..title = "Title"
      ..uid = getRandomString(6);
    await isar.writeTxn(() async {
      await isar.pages.putAll([page]);
      var wpspace = await isar.workspaces.get(workspace.id);
      if (wpspace == null) {
        return;
      }
      wpspace.pages.add(page);
      await wpspace.pages.save();
    });
  }

  Future<void> createWorkspace() async {
    final isar = await db;

    final workspace = Workspace()..title = "Personal Workspace";
    await isar.writeTxn(() async {
      await isar.workspaces.putAll([workspace]);
    });
    print("Finished writing workspace");
  }

  Future<Page?> getPageId() async {
    final isar = await db;
    final page = isar.pages.get(1);
    return page;
  }

  Future<Workspace?> getWorkspace() async {
    final isar = await db;
    final workspace = isar.workspaces.get(1);
    return workspace;
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