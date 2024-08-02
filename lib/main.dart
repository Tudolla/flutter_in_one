import 'package:dummy_flutter_ui/gestures/dimisable_screen.dart';
import 'package:dummy_flutter_ui/gestures/gesturedetector_screen.dart';
import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/bottom_navigation_bar2.dart';
import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/bottom_navigation_screen.dart';
import 'package:dummy_flutter_ui/navigation/drawer/drawer_screen.dart';
import 'package:dummy_flutter_ui/navigation/drawer/main_screen.dart';
import 'package:dummy_flutter_ui/navigation/drawer2/home_screen.dart';
import 'package:dummy_flutter_ui/navigation/tab_bar/tab_bar_screen.dart';
import 'package:dummy_flutter_ui/navigation/tab_bar2/home_page.dart';
import 'package:dummy_flutter_ui/pagination/pages/pagination_home.dart';
import 'package:dummy_flutter_ui/persistence/hive/models/todo_item_model.dart';
import 'package:dummy_flutter_ui/persistence/shared_preferences/sp_home_screen.dart';
import 'package:dummy_flutter_ui/persistence/sqlite/sqlite_home_creen.dart';
import 'package:dummy_flutter_ui/persistence/sqlite2/sqlite_screen.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/customscrollview/custom_scroll_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/customscrollview/custom_scroll_view2.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/customscrollview/custom_scroll_view3.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/gridview/grid_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/gridview/grid_view_builder.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/listview/list_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/listview/list_view_separated.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/pageview/page_view.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/singlechildscrollview/single_child_scroll_page.dart';
import 'package:dummy_flutter_ui/scrolling_widgets/singlechildscrollview/single_child_scroll_page2.dart';
import 'package:dummy_flutter_ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  // await Hive.initFlutter();
  // Hive.registerAdapter(TodoItemAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dummy UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      // home: const TabBarScreen(),
      // home: const HomeTabPage(),
      // home: const MainScreen(),
      // home: const HomeScreenDrawer2(),
      // home: const BottomNavigationScreen(),
      // home: const BottomNavAnimatedScreen(),
      // home: const SingleChildScrollPage(),
      // home: const GridViewScreen(),
      // home: const GridViewBuilderScreen(),
      // home: const PageViewScreen(),
      // home: const HandleOnTap(),
      // home: const DismissibleScreen(),
      // home: const ListViewScreen(),
      // home: const ListViewSeparatedPage(),
      // home: const CustomScrollViewPage(),
      // home: const CustomScrollViewScreen(),
      // home: const CustomScrollPageThree(),
      // home: const SqliteHomeScreen(),
      // home: const SplashScreen(),
      // home: SQLScreen(),
      home: const PaginationScreen(),
      // home: const SharedPrefrenceScreen(),
    );
  }
}
