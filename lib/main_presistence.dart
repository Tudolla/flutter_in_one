// import 'package:dummy_flutter_ui/persistence/hive/models/todo_item_model.dart';
// import 'package:dummy_flutter_ui/persistence/hive/screens/todolist_screen.dart';
// import 'package:dummy_flutter_ui/persistence/hive/services/todo_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(TodoItemAdapter());
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final TodoService _todoService = TodoService();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FutureBuilder(
//           future: _todoService.getAllTodo(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<TodoItem>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return TodoListPage();
//             } else {
//               return const CircularProgressIndicator();
//             }
//           }),
//     );
//   }
// }
