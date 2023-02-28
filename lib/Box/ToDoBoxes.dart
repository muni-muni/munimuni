import 'package:hive/hive.dart';
import 'package:munimuni/models/task.dart';

class ToDoBoxes {
  static Box<Task> getTasks() => 
    Hive.box<Task>('taskList');
}