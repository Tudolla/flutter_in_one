// import 'package:dummy_flutter_ui/monstar_lab/widgets/card_widget.dart';
// import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/bottom_navigation_bar2.dart';
// import 'package:dummy_flutter_ui/navigation/bottom_navigation_bar/models/menu.dart';
// import 'package:dummy_flutter_ui/navigation/drawer2/drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:rive/rive.dart';

// class HomeScreenDrawer2 extends StatefulWidget {
//   const HomeScreenDrawer2({super.key});

//   @override
//   State<HomeScreenDrawer2> createState() => _HomeScreenDrawer2State();
// }

// class _HomeScreenDrawer2State extends State<HomeScreenDrawer2>
//     with SingleTickerProviderStateMixin {
//   List<SMIBool> riveIconInputs = [];
//   List<StateMachineController?> controllers = [];

//   int selectedID = 0;

//   // @override
//   // void dispose() {
//   //   for (var controller in controllers) {
//   //     controller?.dispose();
//   //   }
//   //   super.dispose();
//   // }

//   bool _isPopupVisible = false;
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     _animation =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
//   }

//   @override
//   void dispose() {
//     for (var controller in controllers) {
//       controller?.dispose();
//     }
//     // TODO: implement dispose
//     _animationController.dispose();

//     super.dispose();
//   }

//   void _togglePopup() {
//     setState(() {
//       _isPopupVisible = !_isPopupVisible;
//       if (_isPopupVisible) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Monstarlab VN"),
//         actions: [
//           IconButton(
//             onPressed: _togglePopup,
//             icon: Container(
//               padding: const EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(.4),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: const Icon(
//                 Icons.account_box_rounded,
//               ),
//             ),
//           ),
//         ],
//       ),
//       drawer: const MyDrawer(),
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: const Color(0xFF17303A).withOpacity(.4),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 20,
//                 color: const Color(0xFF17303A).withOpacity(.1),
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(bottomNavItems.length, (index) {
//               final riveIcon = bottomNavItems[index].rive;
//               return GestureDetector(
//                 onTap: () {
//                   riveIconInputs[index].change(true);
//                   setState(() {
//                     selectedID = index;
//                   });
//                   Future.delayed(const Duration(milliseconds: 500), () {
//                     riveIconInputs[index].change(false);
//                   });
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     AnimatedLineBar(
//                       isActive: index == selectedID,
//                     ),
//                     SizedBox(
//                       height: 35,
//                       width: 35,
//                       child: RiveAnimation.asset(
//                         riveIcon.src,
//                         artboard: bottomNavItems[index].rive.artboard,
//                         onInit: (artboard) {
//                           StateMachineController? controller =
//                               StateMachineController.fromArtboard(
//                                   artboard, riveIcon.stateMachineName);
//                           artboard.addController(controller!);
//                           controllers.add(controller);
//                           riveIconInputs.add(
//                               controller.findInput<bool>('active') as SMIBool);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             child: _widgetHomeScreen(),
//           ),
//           Positioned(
//             top: 0,
//             right: 0,
//             child: AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform.scale(
//                   scale: _animation.value,
//                   alignment: Alignment.topRight,
//                   child: child,
//                 );
//               },
//               child: Visibility(
//                 visible: _isPopupVisible,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.75,
//                   height: MediaQuery.of(context).size.height * 0.35,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20),
//                       topLeft: Radius.circular(20),
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               child: ClipRRect(
//                                 child: Image.asset("images/avatar.png"),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               autofocus: false,
//                               enabled: true,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 hintText: "ID account!",
//                                 hintStyle: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               autofocus: false,
//                               enabled: true,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 hintText: "ID password",
//                                 hintStyle: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                           top: 0,
//                           right: 0,
//                           left: 0,
//                           bottom: 0,
//                           child: LottieBuilder.asset(
//                             "assets/animation_bg_login.json",
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _widgetHomeScreen() {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: CardWidget(),
//               ),
//               // Positioned(
//               //   top: 0,
//               //   right: 0,
//               //   left: 0,
//               //   bottom: 0,
//               //   child: Image.asset("assets/background/bgimg.jpg"),
//               // ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
