import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/avatar.png"),
                        // fit: BoxFit.,
                      ),
                    ),
                  ),
                  const Text(
                    "Monstarlab Vietnam",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: const Text("Toyota"),
            leading: Icon(Icons.toys_outlined),
          ),
          ListTile(
            title: const Text("Honda"),
            leading: Icon(Icons.car_crash_outlined),
          ),
          ListTile(
            title: const Text("Volvo"),
            leading: Icon(Icons.car_rental),
          ),
          // SizedBox(
          //   child: Row(
          //     children: [
          //       ListTile(
          //         leading: Icon(Icons.circle_outlined),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.circle_outlined),
          //       ),
          //     ],
          //   ),
          // ),
          ListTile(
            title: const Text("Audi"),
            leading: Icon(Icons.circle_outlined),
          ),
        ],
      ),
    );
  }
}
