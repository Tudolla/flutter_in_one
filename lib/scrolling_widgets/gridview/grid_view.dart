import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        centerTitle: true,
      ),
      body: GridView(
        cacheExtent: 50,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
          myBox(7),
          myBox(8),
          myBox(9),
          myBox(10),
          myBox(11),
          myBox(12),
          myBox(1),
          myBox(2),
          myBox(3),
          myBox(5),
          myBox(6),
          myBox(7),
          myBox(8),
          myBox(9),
          myBox(10),
          myBox(11),
          myBox(12),
          myBox(1),
          myBox(2),
          myBox(3),
          myBox(5),
          myBox(6),
          myBox(7),
          myBox(8),
          myBox(9),
          myBox(10),
          myBox(11),
          myBox(12),
          myBox(1),
          myBox(2),
          myBox(3),
          myBox(5),
          myBox(6),
          myBox(7),
          myBox(8),
          myBox(9),
          myBox(10),
          myBox(11),
          myBox(12),
          myBox(1),
          myBox(2),
          myBox(3),
          myBox(5),
          myBox(6),
          myBox(7),
          myBox(8),
          myBox(9),
          myBox(10),
          myBox(11),
          myBox(12),
        ],
      ),
    );
  }
}

Widget myBox(int i) {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey,
    ),
    child: Center(
      child: Text(
        i.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    ),
  );
}
