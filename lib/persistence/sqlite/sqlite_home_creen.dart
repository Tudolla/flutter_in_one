import 'package:dummy_flutter_ui/persistence/sqlite/db_helper.dart';
import 'package:flutter/material.dart';

class SqliteHomeScreen extends StatefulWidget {
  const SqliteHomeScreen({super.key});

  @override
  State<SqliteHomeScreen> createState() => _SqliteHomeScreenState();
}

class _SqliteHomeScreenState extends State<SqliteHomeScreen> {
  List<Map<String, dynamic>> _allData = [];
  bool _idLoading = true;
  void _refreshData() async {
    final data = await SQLHelper.getData();
    setState(() {
      _allData = data;
      _idLoading = false;
    });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addData() async {
    await SQLHelper.createData(
        _titleController.text, _descriptionController.text);

    _refreshData();
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(
        id, _titleController.text, _descriptionController.text);
    _refreshData();
  }

  Future<void> _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text("Deleted $id")));
    _refreshData();
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Note"),
        centerTitle: true,
      ),
      body: _idLoading
          ? FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 2),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              })
          // ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      _allData[index]['title'].toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      _allData[index]['description'],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    trailing: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showBottomSheet(_allData[index]['id']);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteData(_allData[index]['id']);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(int? id) async {
    if (id != null) {
      final existData = _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existData['title'];
      _descriptionController.text = existData['description'];
    }

    showModalBottomSheet(
        elevation: 6,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.1),
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 4,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "description",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () async {
                    if (id == null) {
                      await _addData();
                      dispose();
                    } else {
                      await _updateData(id);
                      dispose();
                    }
                    Navigator.of(_).pop();
                    print("ADDED roi nha ???");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      id == null ? "Add " : "Update",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )),
              ],
            ),
          );
        });
  }
}
