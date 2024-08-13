import 'package:flutter/material.dart';

class Animation404Screen extends StatefulWidget {
  const Animation404Screen({super.key});

  @override
  State<Animation404Screen> createState() => _Animation404ScreenState();
}

class _Animation404ScreenState extends State<Animation404Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // the first position widget displays an animated image that rotate back and forth
          Positioned(
            bottom: sizeHeight / 4.4,
            right: sizeHeight / 20,
            child: AnimatedBuilder(
              animation: _animationController,
              child: Image.asset(
                "images/light.png",
                height: sizeHeight * 1.3,
              ),
              builder: (context, widget) {
                // th transform widget is used to rotate image around
                return Transform.rotate(
                  angle: _animationController.value,
                  alignment: Alignment.bottomCenter,
                  child: widget,
                );
              },
            ),
          ),

          Positioned(
            child: Image.asset(
              "images/source.png",
              width: sizeHeight / 4.6,
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "404",
                  style: TextStyle(
                    fontSize: sizeHeight / 5,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Page not Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: sizeHeight * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
