import 'package:dummy/monstar_lab/screen/drawer.dart';
import 'package:dummy/monstar_lab/widgets/card_widget.dart';
import 'package:dummy/monstar_lab/widgets/notification_widget.dart';
import 'package:dummy/navigation/bottom_navigation_bar/bottom_navigation_bar2.dart';
import 'package:dummy/navigation/bottom_navigation_bar/models/menu.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreenDrawer2 extends StatefulWidget {
  const HomeScreenDrawer2({super.key});

  @override
  State<HomeScreenDrawer2> createState() => _HomeScreenDrawer2State();
}

class _HomeScreenDrawer2State extends State<HomeScreenDrawer2>
    with SingleTickerProviderStateMixin {
  late TextEditingController _idController;
  late TextEditingController _passController;
  bool _showLogin = false;
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];

  int selectedID = 0;

  bool _isPopupVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _idController = TextEditingController();
    _passController = TextEditingController();
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    _animationController.dispose();
    _idController.dispose();
    _passController.dispose();

    super.dispose();
  }

  void _toggleLogin() {
    setState(() {
      _showLogin = !_showLogin;
      if (!_showLogin) {
        _idController.clear();
        _passController.clear();
      }
    });
  }

  void _togglePopup() {
    setState(() {
      _isPopupVisible = !_isPopupVisible;
      if (_isPopupVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
        _toggleLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Monstarlab VN"),
        actions: [
          IconButton(
            onPressed: _togglePopup,
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.account_box_rounded,
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
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
                            artboard,
                            riveIcon.stateMachineName,
                          );
                          artboard.addController(controller!);
                          controllers.add(controller);
                          riveIconInputs.add(
                            controller.findInput<bool>('active') as SMIBool,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
            child: Container(
              child: _widgetHomeScreen(),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  alignment: Alignment.topRight,
                  child: child,
                );
              },
              child: Visibility(
                visible: _isPopupVisible,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: ClipRRect(
                              // child: Image.asset("images/avatar.png"),
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: true,
                          enabled: true,
                          controller: _idController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "ID account!",
                            hintStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          autofocus: true,
                          enabled: true,
                          controller: _passController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "ID password",
                            hintStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[50],
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetHomeScreen() {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardWidget(),
              BellWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
