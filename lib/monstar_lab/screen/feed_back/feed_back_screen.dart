import 'package:flutter/material.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
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

          // -- Listview --
        ],
      ),
    );
  }
}
