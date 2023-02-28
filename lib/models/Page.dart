import 'package:isar/isar.dart';

part 'Page.g.dart';
@collection
class Page {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? icon;
  String? coverPhoto;
  List<String>? blocks;
}
