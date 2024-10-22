import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:soul/models/rive_asset.dart';
import 'package:soul/screens/animated_bar.dart';
import 'package:soul/utils/rive_utils.dart';

class BottomNav extends StatefulWidget {
  final Widget child;
  const BottomNav({super.key, required this.child});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<RiveAsset> bottomNavs = [
    RiveAsset("assets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity",
        title: "Home",
        route: '/home'),
    RiveAsset("assets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity",
        title: "Chat",
        route: '/chat'),
    RiveAsset("assets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity",
        title: "Timer",
        route: '/moods'),
    RiveAsset("assets/icons.riv",
        artboard: "AUDIO",
        stateMachineName: "AUDIO_Interactivity",
        title: "Audio",
        route: '/voice'),
    RiveAsset("assets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
        title: "Search",
        route: '/stats'),
  ];

  late RiveAsset selectedBottomNav;

  @override
  void initState() {
    super.initState();
    selectedBottomNav = bottomNavs.first;
  }

  void _onTapNavItem(int index) {
    final selectedNav = bottomNavs[index];
    if (selectedNav != selectedBottomNav) {
      setState(() {
        selectedBottomNav = selectedNav;
      });
      // Trigger the Rive animation
      for (var nav in bottomNavs) {
        nav.input?.value = nav == selectedNav; // Set active input
      }
      // Navigate to the selected route
      GoRouter.of(context).go(selectedNav.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      extendBody:
          true, // Ensures that the bottom nav bar overlaps with the body
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              20), // Apply rounded corners to blur as well
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 7, sigmaY: 7), // Only blur inside this container
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () => _onTapNavItem(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                          isActive: bottomNavs[index] == selectedBottomNav,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs[index].src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                final controller = RiveUtils.getRiveController(
                                  artboard,
                                  stateMachineName:
                                      bottomNavs[index].stateMachineName,
                                );
                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool?;
                              },
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
        ),
      ),
    );
  }
}
