import 'package:dummy/scrolling_widgets/listview/account_model.dart';
import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListViewSeparated"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: accountList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(accountList[index].image),
            ),
            title: Text(accountList[index].name),
            subtitle: Text(accountList[index].professional),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
