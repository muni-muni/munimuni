import 'dart:async';
import 'dart:ffi';

import 'package:isar/isar.dart';
import 'package:munimuni/models/Block.dart';
import 'package:munimuni/models/Page.dart';
import 'package:munimuni/models/Workspace.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }
  Future<bool> hasWorkspace() async {
    final isar = await db;
    int count = await isar.workspaces.count();
    if (count > 0) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<void> createWorkspace() async {
    final isar = await db;

    final workspace = Workspace()..title = "Personal Workspace";
    await isar.writeTxn(() async {
      await isar.workspaces.putAll([workspace]);
    });
    print("Finished writing workspace");
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
