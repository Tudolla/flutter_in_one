import 'package:dummy_flutter_ui/gestures/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleOnTap extends StatefulWidget {
  const HandleOnTap({super.key});

  @override
  State<HandleOnTap> createState() => _HandleOnTapState();
}

class _HandleOnTapState extends State<HandleOnTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GestureDetector vs InkWell",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const HomePage());
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("GestureDetector"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => const HomePage());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: const Text("On Tap with InkWell"),
                  ),
                );
              },
              splashFactory: InkRipple.splashFactory,
              splashColor: Colors.blue.withOpacity(.5),
              highlightColor: Colors.red.withOpacity(.4),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("InkWell"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
