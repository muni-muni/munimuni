import 'package:isar/isar.dart';
import 'Block.dart';

part 'Page.g.dart';

@collection
class Page {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? icon;
  String? coverPhoto;
  final blocks = IsarLinks<Block>();
}
