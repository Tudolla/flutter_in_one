import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BellWidget extends StatefulWidget {
  const BellWidget({super.key});

  @override
  State<BellWidget> createState() => _BellWidgetState();
}

class _BellWidgetState extends State<BellWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 80,
      child: LottieBuilder.asset("assets/bell.json"),
    );
  }
}
