import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/homescreen.dart';
import 'package:soul/screens/mood1.dart';
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
    const Mood1Screen(),
    const SoulVoiceScreen(),
    const Statsscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // body:
      bottomNavigationBar: ConvexAppBar(
        // const <int, dynamic>{1: '3+'}, //new msgs (index, number)
        items: [
          TabItem(
            icon: Icon(
              CupertinoIcons.home,
              color: currentPageIndex == 0 ? Colors.deepPurple : Colors.white,
            ),
            title: "Home",
          ),
          TabItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_fill,
              color: currentPageIndex == 1 ? Colors.deepPurple : Colors.white,
            ),
            title: "SoulBot",
          ),
          TabItem(
            icon: Icon(
              CupertinoIcons.add,
              color: currentPageIndex == 2 ? Colors.deepPurple : Colors.white,
            ),
            title: "Moods",
          ),
          TabItem(
            icon: Icon(
              CupertinoIcons.mic_fill,
              color: currentPageIndex == 3 ? Colors.deepPurple : Colors.white,
            ),
            title: "Voice",
          ),
          TabItem(
            icon: Icon(
              CupertinoIcons.graph_square_fill,
              color: currentPageIndex == 4 ? Colors.deepPurple : Colors.white,
            ),
            title: "Stats",
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        shadowColor: const Color.fromARGB(255, 14, 14, 14),
        backgroundColor: Colors.deepPurple,
      ),
      body: _screens[currentPageIndex],
    );
  }
}
