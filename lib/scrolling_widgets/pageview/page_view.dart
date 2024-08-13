import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: const Center(
              child: Text("PageView 1"),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: const Center(
              child: Text("PageView 2"),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: const Center(
              child: Text("PageView 3"),
            ),
          ),
        ],
      ),
    );
  }
}
