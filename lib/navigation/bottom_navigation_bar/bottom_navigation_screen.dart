import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> _navigationItem = const [
    Icon(Icons.home),
    Icon(Icons.settings),
    Icon(Icons.person),
    Icon(Icons.dashboard),
  ];
  Color bgColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: bgColor,
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.none,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(
          Icons.add_alert_rounded,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        items: _navigationItem,
        backgroundColor: Colors.blueGrey,
        color: Colors.deepOrange.shade100,
        onTap: (index) {
          if (index == 0) {
            setState(() {
              bgColor = Colors.yellow;
            });
          } else if (index == 1) {
            setState(() {
              bgColor = Colors.green;
            });
          } else {
            setState(() {
              bgColor = Colors.pink;
            });
          }
          // setState(() {});
        },
      ),
    );
  }
}
