import 'package:flutter/material.dart';

class CustomScrollPageThree extends StatelessWidget {
  const CustomScrollPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.white,
            ),
            elevation: 4.0,
            // pinned: true,
            stretch: true,
            title: const Text(
              "Motel Canada",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            expandedHeight: 250,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
              ],
              background: Image(
                image: AssetImage(
                  "images/fancy.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 1.0,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(-10),
              child: SizedBox(),
            ),
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.white,
            //   ),
            //   child: TextFormField(
            //     autofocus: false,
            //     enabled: true,
            //     decoration: const InputDecoration(
            //         hintText: "Search...",
            //         prefixIcon: Icon(Icons.search),
            //         border: InputBorder.none,
            //         hintStyle: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18,
            //         )),
            //   ),
            // ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const SearchBar(
                hintText: "Search...",
              ),
            ),
          ),

          // -- Listview --

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                  child: Container(
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.withOpacity(.2),
                    ),
                    // height: 200,
                    // width: MediaQuery.of(context).size.width,
                    child: Text("Item $index"),
                  ),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              // mainAxisExtent: 100,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
