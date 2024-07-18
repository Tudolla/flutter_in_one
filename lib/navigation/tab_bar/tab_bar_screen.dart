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
        length: 5,
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
              buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
              splashColor: Colors.purpleAccent.withOpacity(.5),
              backgroundColor: Colors.orangeAccent.withOpacity(.5),
              unselectedBackgroundColor: Colors.grey.withOpacity(.3),
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
                Tab(
                  icon: Icon(Icons.sports_bar_outlined),
                  text: "Bar",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Page 1"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Page 2"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Page 3"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Page 4"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Page 5"),
              ),
            ),
          ]),
        ));
  }
}
