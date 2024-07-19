import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              myItem("Dimaria", Colors.blueGrey),
              const SizedBox(
                height: 10,
              ),
              myItem("Ronando Dnima", Colors.greenAccent),
              const SizedBox(
                height: 10,
              ),
              myItem("Secso Anguero", Colors.yellowAccent),
              const SizedBox(
                height: 10,
              ),
              myItem("Karim Benzema", Colors.redAccent),
              const SizedBox(
                height: 10,
              ),
              myItem("Lukaku", Colors.pinkAccent),
              const SizedBox(
                height: 10,
              ),
              myItem("Mpabe", Colors.purpleAccent),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myItem(String s, Color color) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        s,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}
