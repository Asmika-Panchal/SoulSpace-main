import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/homescreen.dart';
import 'package:soul/screens/profile_view.dart';
import 'package:soul/screens/soulspace.dart';
import 'package:soul/screens/soulvoice_view.dart';
import 'package:soul/screens/statsscreen.dart';

class SoulBotHome extends StatefulWidget {
  const SoulBotHome({super.key});

  @override
  State<SoulBotHome> createState() => _SoulBotHomeState();
}

class _SoulBotHomeState extends State<SoulBotHome> {
  int currentPageIndex = 0;
  final List<Widget> _screens = [
    const SoulHomeScreen(),
    const ChatScreen(),
    const SoulVoiceScreen(),
    const Statsscreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // body:
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 800),
        indicatorColor: Colors.deepPurple,
        backgroundColor: const Color.fromARGB(255, 46, 5, 53),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Makes it rounder
        ),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.home), label: "Home"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.chat_bubble_fill), label: "SoulBot"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.mic_fill), label: "SoulVoice"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.graph_square_fill), label: "Stats"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
        ],
      ),
      body: _screens[currentPageIndex],
    );
  }
}
