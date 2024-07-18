import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/carousel_slider_page.dart';
import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BottomNavAnimatedScreen extends StatefulWidget {
  const BottomNavAnimatedScreen({super.key});

  @override
  State<BottomNavAnimatedScreen> createState() =>
      _BottomNavAnimatedScreenState();
}

class _BottomNavAnimatedScreenState extends State<BottomNavAnimatedScreen> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  List<Widget> pages = [
    CarouselSliderPage(),
    CarouselSliderPage(),
    CarouselSliderPage(),
    CarouselSliderPage(),
    CarouselSliderPage()
  ];
  int selectedID = 0;

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                alignment: Alignment.topCenter, child: pages[selectedID])),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF17303A).withOpacity(.4),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xFF17303A).withOpacity(.1),
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(bottomNavItems.length, (index) {
                final riveIcon = bottomNavItems[index].rive;
                return GestureDetector(
                  onTap: () {
                    riveIconInputs[index].change(true);
                    setState(() {
                      selectedID = index;
                    });
                    Future.delayed(const Duration(milliseconds: 500), () {
                      riveIconInputs[index].change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedLineBar(
                        isActive: index == selectedID,
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: bottomNavItems[index].rive.artboard,
                          onInit: (artboard) {
                            StateMachineController? controller =
                                StateMachineController.fromArtboard(
                                    artboard, riveIcon.stateMachineName);
                            artboard.addController(controller!);
                            controllers.add(controller);
                            riveIconInputs.add(controller
                                .findInput<bool>('active') as SMIBool);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}

class AnimatedLineBar extends StatelessWidget {
  final bool isActive;
  const AnimatedLineBar({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
