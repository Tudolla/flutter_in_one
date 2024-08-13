import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blueGrey,
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage(
                  "images/place1.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
            title: const Text(
              "CustomeScroll",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return ListTile(
                  title: Text("Let ${index}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
