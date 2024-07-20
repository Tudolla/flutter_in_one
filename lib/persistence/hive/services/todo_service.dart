import 'package:dummy_flutter_ui/persistence/hive/models/todo_item_model.dart';
import 'package:hive/hive.dart';

class TodoService {
  final String _boxName = "todoBox";

  Future<Box<TodoItem>> get _box async {
    return await Hive.openBox<TodoItem>(_boxName);
  }

  Future<void> addItem(TodoItem todoItem) async {
    var box = await _box;
    await box.add(todoItem);
  }

  Future<List<TodoItem>> getAllTodo() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteTodo(int index) async {
    var box = await _box;
    box.deleteAt(index);
  }

  Future<void> updateIsCompleted(int index, TodoItem todoItem) async {
    var box = await _box;
    todoItem.isCompleted = !todoItem.isCompleted;
  }
}
