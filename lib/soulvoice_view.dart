import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class SoulVoiceScreen extends StatefulWidget {
  const SoulVoiceScreen({super.key});

  @override
  _SoulVoiceScreenState createState() => _SoulVoiceScreenState();
}

class _SoulVoiceScreenState extends State<SoulVoiceScreen>
    with TickerProviderStateMixin {
  late final GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Black tray with blur effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg3.jpeg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.black.withOpacity(0.5), // Black tray with opacity
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Text(
                  'Hi, I am Soul Voice!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Tell me, How can I help you?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                // Microphone icon with animated GIF
                Gif(
                  autostart: Autostart.loop,
                  placeholder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                  image: const AssetImage('assets/mic.gif'),
                ),
                SizedBox(height: 30),
                // Display sound.jpeg as an image
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Dynamically adjust the width
                  height: 100,
                  child: Image.asset(
                    'assets/sound.png', // Add the image for the sound
                    fit: BoxFit.contain, // Adjust the image fit as needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }
}
