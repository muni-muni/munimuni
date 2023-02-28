import 'package:isar/isar.dart';

part 'Block.g.dart';

@collection
class Block {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? blockType;
  String? content; 
}
