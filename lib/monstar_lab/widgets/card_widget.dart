import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 3) * 2,
      height: (MediaQuery.of(context).size.width / 3),
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
      ),
    );
  }
}
