import 'package:isar/isar.dart';

part 'Workspace.g.dart';
@collection
class Workspace {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? blockType;
  String? content;
  List<String>? pages;
}
