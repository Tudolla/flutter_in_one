import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Tab Bar"),
            // bottom: TabBar(
            //   tabs: [
            //     Tab(
            //       icon: Icon(Icons.home_filled),
            //     ),
            //     Tab(
            //       icon: Icon(Icons.search_off_outlined),
            //     ),
            //     Tab(
            //       icon: Icon(Icons.settings),
            //     ),
            //     Tab(
            //       icon: Icon(Icons.person_2_outlined),
            //     ),
            //   ],
            // ),

            bottom: ButtonsTabBar(
              buttonMargin: EdgeInsets.symmetric(horizontal: 20),
              splashColor: Colors.purpleAccent.withOpacity(.5),
              backgroundColor: Colors.orangeAccent.withOpacity(.5),
              unselectedBackgroundColor: Colors.grey.withOpacity(.1),
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: "Bike",
                ),
                Tab(
                  icon: Icon(Icons.accessible_forward_outlined),
                  text: "Style",
                ),
                Tab(
                  icon: Icon(Icons.beach_access_outlined),
                  text: "Beach",
                ),
                Tab(
                  icon: Icon(Icons.bakery_dining_outlined),
                  text: "Queen",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Page 1"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Page 1"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Page 1"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Page 1"),
              ),
            ),
          ]),
        ));
  }
}
