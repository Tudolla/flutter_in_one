import 'package:dummy/animations/error_aniamtion/screens/animation_404_screen.dart';
import 'package:dummy/common_widgets/music_player_ui/screens/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // home: const PaginationScreen(),
      // home: const SharedPrefrenceScreen(),
      // home: const SplashPage(),
      home: const Animation404Screen(),
    );
  }
}
