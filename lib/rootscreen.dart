import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/homescreen.dart';
import 'package:soul/profile_view.dart';
import 'package:soul/soulspace.dart';
import 'package:soul/soulvoice_view.dart';

class SoulBotHome extends StatefulWidget {
  const SoulBotHome({super.key});

  @override
  State<SoulBotHome> createState() => _SoulBotHomeState();
}

class _SoulBotHomeState extends State<SoulBotHome> {
  int currentPageIndex = 0;
  final List<Widget> _screens = [
    SoulHomeScreen(),
    ChatScreen(),
    SoulVoiceScreen(),
    // Stats
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // body:
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.purple,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.home),
              icon: Icon(CupertinoIcons.home),
              label: "Home"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.chat_bubble_fill), label: "SoulBot"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.mic_fill), label: "SoulVoice"),
          NavigationDestination(
              icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
        ],
      ),
      body: _screens[currentPageIndex],
    );
  }

  Widget _buildRecentHistoryCard(String label, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
