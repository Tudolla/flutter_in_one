import 'package:dummy/navigation/tab_bar2/tab_item.dart';
import 'package:flutter/material.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tabbar",
              style: TextStyle(fontSize: 15),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.green.shade100,
                  ),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: Colors.green.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      tabs: const [
                        TabItem(title: "Inbox", count: 22),
                        TabItem(title: "Cart", count: 2),
                        TabItem(title: "Message", count: 6),
                      ]),
                ),
              ),
            ),
          ),
          body: const TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Nikola Tesla"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Thich Nhat Hanh"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Edison"),
              ),
            ),
          ]),
        ));
  }
}
