import 'package:flutter/material.dart';

class SingleChildScrollPage extends StatefulWidget {
  const SingleChildScrollPage({super.key});

  @override
  State<SingleChildScrollPage> createState() => _SingleChildScrollPageState();
}

class _SingleChildScrollPageState extends State<SingleChildScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
