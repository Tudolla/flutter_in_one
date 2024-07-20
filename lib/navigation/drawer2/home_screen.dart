import 'package:dummy_flutter_ui/monstar_lab/widgets/card_widget.dart';
import 'package:dummy_flutter_ui/navigation/drawer2/drawer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreenDrawer2 extends StatefulWidget {
  const HomeScreenDrawer2({super.key});

  @override
  State<HomeScreenDrawer2> createState() => _HomeScreenDrawer2State();
}

class _HomeScreenDrawer2State extends State<HomeScreenDrawer2>
    with SingleTickerProviderStateMixin {
  bool _isPopupVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();

    super.dispose();
  }

  void _togglePopup() {
    setState(() {
      _isPopupVisible = !_isPopupVisible;
      if (_isPopupVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
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
      body: Stack(
        children: [
          Container(
            child: _widgetHomeScreen(),
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
                  height: MediaQuery.of(context).size.height * 0.35,
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
                            child: Image.asset("images/avatar.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: false,
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "ID account!",
                            hintStyle: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: false,
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "ID password",
                            hintStyle: TextStyle(
                              fontSize: 15,
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CardWidget(),
          ),
        )
      ],
    );
  }
}
