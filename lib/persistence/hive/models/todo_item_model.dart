import 'package:hive_flutter/hive_flutter.dart';
part 'todo_item_model.g.dart';

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String title;
  // final String description;
  @HiveField(1, defaultValue: false)
  bool isCompleted;

  TodoItem(this.title, this.isCompleted);
}
