// ignore_for_file: unused_element

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
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
              image: AssetImage('assets/soulbg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
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
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4)),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10, sigmaY: 10), // Glass blur effect
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                                0.6), // Semi-transparent dark color
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.2)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Your Text Here',
                              hintStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Colors
                                  .transparent, // Make the fill color transparent
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white), // Text color
                          ),
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
            SizedBox(
              height: screenHeight * 0.015,
            )
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
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass blur effect
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 108, 88, 149)
                  .withOpacity(0.2), // Semi-transparent dark color
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(
                  color: const Color.fromARGB(255, 191, 195, 255)
                      .withOpacity(0.2)), // Optional border
            ),
            child: Text(
              message,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBotMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass blur effect
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.2), // Semi-transparent dark color
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(
                  color: Colors.white.withOpacity(0.2)), // Optional border
            ),
            child: Text(
              message,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
