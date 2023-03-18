import 'package:isar/isar.dart';
import 'Page.dart';
part 'Workspace.g.dart';

@collection
class Workspace {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? blockType;
  String? content;
  final pages = IsarLinks<Page>();
}
