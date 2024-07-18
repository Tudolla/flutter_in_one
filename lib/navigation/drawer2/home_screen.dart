import 'package:dummy_flutter_ui/navigation/drawer2/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer2 extends StatelessWidget {
  const HomeScreenDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Monstarlab"),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            "Good morning",
            style: TextStyle(
              fontSize: 30,
              fontFamily: AutofillHints.addressCityAndState,
            ),
          ),
        ),
      ),
    );
  }
}
