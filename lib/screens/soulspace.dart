// ignore_for_file: unused_element

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => 1 + 1,
          // Navigator.of(context).pop(),
        ),
        title: const Row(
          children: [
            Icon(CupertinoIcons.heart_circle_fill, color: Colors.white),
            SizedBox(width: 8),
            Text('Soulspace', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.black.withOpacity(0.3),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  buildUserMessage("I don’t feel so good"),
                  const SizedBox(height: 16),
                  buildBotMessage(
                      "I’m sorry to hear that. Are you feeling physically unwell, or is it more of an emotional or mental strain? If you’re comfortable sharing, I might be able to offer some advice or just be here to listen."),
                  const SizedBox(height: 16),
                  buildUserMessage("Yeah give some advice"),
                  const SizedBox(height: 16),
                  buildBotMessage(
                      "Feel Better Tips\n• Take a break & relax\n• Stay active with a short walk/stretch\n• Connect with nature"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Your Text Here',
                        filled: true,
                        fillColor: Colors.black,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(CupertinoIcons.arrow_up_circle_fill,
                        size: 55, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildBottomNavItem(
      IconData icon, bool isActive, String label, BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: isActive ? Colors.purpleAccent : const Color(0xff6F2685),
            size: screenHeight * 0.04),
        SizedBox(height: screenHeight * 0.005),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.015),
        ),
      ],
    );
  }

  Widget buildUserMessage(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff860EAA), Color(0xff360644)]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildBotMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF663DFF), // #663dff
              Color(0xFFAA00FF), // #aa00ff
              Color(0xFFCC4499), // #cc4499
            ],
            stops: [0.0, 0.37, 1.0],
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}