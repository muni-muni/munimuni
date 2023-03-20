import 'package:isar/isar.dart';
import 'package:munimuni/models/Workspace.dart';
import 'package:munimuni/models/Page.dart';
part 'User.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String? name;
  final workspaces = IsarLinks<Workspace>();
  final defaultWorkspace = IsarLink<Workspace>();
  final defaultPage = IsarLink<Page>();

}
