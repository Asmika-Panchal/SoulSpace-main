import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/profile_view.dart'; // Import your ProfileScreen
import 'package:soul/screens/soulspace.dart';
import 'package:soul/screens/soulvoice_view.dart';
import 'package:soul/screens/statsscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoulHomeScreen(),
    );
  }
}

class SoulHomeScreen extends StatelessWidget {
  const SoulHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4)),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, John',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.045,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'How can I assist you right now?',
                                style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileScreen()), // Navigate to ProfileScreen
                            );
                          },
                          child: Hero(
                            tag: "my-hero-animation-tag",
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: screenHeight * 0.04,
                              child: Image.asset("assets/profile.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(16)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xff5B2C6F),
                                        Color(0xff9B59B6)
                                      ])),
                              height: screenHeight * 0.31,
                              width: screenWidth * 0.4,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    padding: const EdgeInsets.all(7),
                                    child: const Icon(
                                      CupertinoIcons.mic,
                                      size: 35,
                                      color: Color(0xff360844),
                                    ),
                                  ),
                                  const Text(
                                    'Talk with SoulVoice',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SoulVoiceScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(40)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff2ECC71),
                                        Color(0xffA3D9B1)
                                      ])),
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.4,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    padding: const EdgeInsets.all(7),
                                    child: const Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 35,
                                      color: Color(0xff512E5F),
                                    ),
                                  ),
                                  const Text(
                                    'Chat',
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff512E5F)),
                                  ),
                                ],
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatScreen()),
                              );
                            },
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xffF1948A),
                                        Color(0xffF5B7B1)
                                      ])),
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.4,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    padding: const EdgeInsets.all(7),
                                    child: const Icon(
                                      CupertinoIcons.graph_square_fill,
                                      size: 35,
                                      color: Color(0xff512E5F),
                                    ),
                                  ),
                                  const Text(
                                    'Stats',
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff512E5F)),
                                  ),
                                ],
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Statsscreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Recent History',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      children: [
                        _buildRecentHistoryCard("Continue chat",
                            const Color(0xffE57373), "2024-09-17", () {
                          // Handle delete action
                        }),
                        _buildRecentHistoryCard("Continue chat",
                            const Color(0xffD7CCC8), "2024-09-17", () {
                          // Handle delete action
                        }),
                        _buildRecentHistoryCard("Continue chat",
                            const Color(0xff81D4FA), "2024-09-17", () {
                          // Handle delete action
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentHistoryCard(
      String label, Color color, String date, VoidCallback onDelete) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.black87),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
