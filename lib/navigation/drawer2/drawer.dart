import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                title: const Text("Feed back"),
                leading: Icon(Icons.feedback_outlined),
              ),
              ListTile(
                title: const Text("Achievements"),
                leading: Icon(Icons.price_change_outlined),
              ),
              ListTile(
                title: const Text("Work day"),
                leading: Icon(Icons.calendar_month_outlined),
              ),
              ListTile(
                title: const Text("About company"),
                leading: Icon(Icons.square_outlined),
              ),
            ],
          ),
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(20),
          //   color: Colors.blueGrey,
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Container(
          //           height: 150,
          //           width: 100,
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //               image: AssetImage("images/avatar.png"),
          //               // fit: BoxFit.,
          //             ),
          //           ),
          //         ),
          //         const Text(
          //           "Monstarlab Vietnam",
          //           style: TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // ListTile(
          //   title: const Text("Feed back"),
          //   leading: Icon(Icons.feedback_outlined),
          // ),
          // ListTile(
          //   title: const Text("Achievements"),
          //   leading: Icon(Icons.price_change_outlined),
          // ),
          // ListTile(
          //   title: const Text("Work day"),
          //   leading: Icon(Icons.calendar_month_outlined),
          // ),
          // ListTile(
          //   title: const Text("About company"),
          //   leading: Icon(Icons.square_outlined),
          // ),
          ListTile(
            title: const Text("Sign out!"),
            leading: Icon(Icons.login_rounded),
          ),
        ],
      ),
    );
  }
}
