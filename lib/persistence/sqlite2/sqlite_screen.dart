import 'package:dummy_flutter_ui/persistence/sqlite2/sql_helper.dart';
import 'package:flutter/material.dart';

class SQLScreen extends StatefulWidget {
  const SQLScreen({super.key});

  @override
  State<SQLScreen> createState() => _SQLScreenState();
}

class _SQLScreenState extends State<SQLScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> _allNote = [];
  bool _isLoading = true;

  void _refreshNote() async {
    final data = await SQLHelper.getItems();

    setState(() {
      _allNote = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshNote();
  }

  Future<void> _addItem() async {
    await SQLHelper.createItems(
        _titleController.text, _descriptionController.text);
    _refreshNote();
    print("number of items: ${_allNote.length}");
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      _titleController.text,
      _descriptionController.text,
    );

    _refreshNote();
  }

  Future<void> _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshNote();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingNote = _allNote.firstWhere((e) => e['id'] == id);
      _titleController.text = existingNote['title'];
      _descriptionController.text = existingNote['description'];
    }

    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (id == null) {
                      await _addItem();
                    }
                    if (id != null) {
                      await _updateItem(id);
                    }

                    _titleController.text = '';
                    _descriptionController.text = '';
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  },
                  child: Text(id == null ? 'Create' : 'Update'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite note"),
      ),
      body: ListView.builder(
          itemCount: _allNote.length,
          itemBuilder: (context, index) {
            return Card(
              color: index % 4 == 0
                  ? Colors.green.shade300
                  : index % 3 == 0
                      ? Colors.pink.shade200
                      : index % 2 == 0
                          ? Colors.blue.shade200
                          : Colors.yellow.shade300,
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                title: Text(
                  _allNote[index]['title'],
                ),
                subtitle: Text(_allNote[index]['description']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => _showForm(_allNote[index]['id']),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deleteItem(_allNote[index]['id']),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        tooltip: "Add",
        child: const Icon(Icons.add),
      ),
    );
  }
}
