import 'package:dummy_flutter_ui/monstar_lab/screens/drawer_screen.dart';
import 'package:dummy_flutter_ui/monstar_lab/screens/home_page.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
