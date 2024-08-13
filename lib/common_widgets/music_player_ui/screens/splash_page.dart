import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.blueGrey[500]!, Colors.blueGrey[900]!],
            stops: [0.4, 1.0],
          ),
        ),
        child: Center(
          child: Image.asset("images/avatar.png"),
        ),
      ),
    );
  }


}