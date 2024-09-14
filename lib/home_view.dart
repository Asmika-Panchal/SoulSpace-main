import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoulBotApp extends StatelessWidget {
  const SoulBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoulBotHome(),
    );
  }
}

class SoulBotHome extends StatelessWidget {
  const SoulBotHome({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, John',
                            style: TextStyle(
                              fontSize: screenHeight * 0.045,
                              // fontWeight: FontWeight.bold,
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
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: screenHeight * 0.04,
                        child: Image.asset("assets/profile.png"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(16)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: const [
                                          Color(0xffC56EE0),
                                          Color.fromARGB(255, 174, 83, 201),
                                          Color(0xff580970)
                                        ])),
                                height: screenHeight * 0.31,
                                width: screenWidth * 0.4,
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffC26BDD),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: Icon(
                                        CupertinoIcons.mic,
                                        size: 35,
                                        color: Color(0xff360844),
                                      ),
                                    ),
                                    const Text(
                                      'Talk with SoulVoice',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(40)),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: const [
                                      Color(0xffC4FFB2),
                                      Color(0xff00C472)
                                    ])),
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.4,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff17CB79),
                                  ),
                                  padding: EdgeInsets.all(7),
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 35,
                                    color: Color(0xff360844),
                                  ),
                                ),
                                const Text(
                                  'Chat',
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff360844)),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: const [
                                      Color(0xffF0CB93),
                                      Color(0xffE65D5D)
                                    ])),
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.4,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffECA681),
                                  ),
                                  padding: EdgeInsets.all(7),
                                  child: Icon(
                                    CupertinoIcons.graph_square_fill,
                                    size: 35,
                                    color: Color(0xff360844),
                                  ),
                                ),
                                const Text(
                                  'Stats',
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff360844)),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Recent History',
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: screenHeight *
                            0.05), // Add padding to avoid overflow
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      children: [
                        _buildRecentHistoryCard(
                            'Recent History 1', Color(0xffD65C60)),
                        _buildRecentHistoryCard(
                            'Recent History 2', Color(0xffCDA38F)),
                        _buildRecentHistoryCard(
                            'Recent History 3', Color(0xff8DCBCE)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(CupertinoIcons.home, true, 'Home', context),
              _buildBottomNavItem(
                  CupertinoIcons.chat_bubble_fill, false, 'Soulbot', context),
              _buildBottomNavItem(
                  CupertinoIcons.mic, false, 'SoulVoice', context),
              _buildBottomNavItem(
                  CupertinoIcons.graph_square_fill, false, 'Stats', context),
              _buildBottomNavItem(
                  CupertinoIcons.person, false, 'Profile', context),
            ],
          ),
        ),
      ),
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

  Widget _buildBottomNavItem(
      IconData icon, bool isActive, String label, BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: isActive ? Colors.purpleAccent : Color(0xff6F2685),
            size: screenHeight * 0.04),
        SizedBox(height: screenHeight * 0.005),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.015),
        ),
      ],
    );
  }
}
