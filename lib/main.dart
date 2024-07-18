import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/bottom_navigation_bar2.dart';
import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/bottom_navigation_screen.dart';
import 'package:dummy_flutter_ui/navigation/drawer/main_screen.dart';
import 'package:dummy_flutter_ui/navigation/drawer2/home_screen.dart';
import 'package:dummy_flutter_ui/navigation/tab_bar/tab_bar_screen.dart';
import 'package:dummy_flutter_ui/navigation/tab_bar2/home_page.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/gridview/grid_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/gridview/grid_view_builder.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/gridview/page_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/singlechildscrollview/single_child_scroll_page.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/singlechildscrollview/single_child_scroll_page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dummy UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const TabBarScreen(),
      // home: const HomePage(),
      // home: const HomeScreenDrawer2(),
      // home: const BottomNavigationScreen(),
      // home: const BottomNavAnimatedScreen(),
      // home: const SingleChildScrollPage(),
      // home: const GridViewScreen(),
      // home: const GridViewBuilderScreen(),
      home: const PageViewScreen(),
    );
  }
}
