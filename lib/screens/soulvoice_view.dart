import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/voicepage.jpeg'), // Background image
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
          // Main content with glassmorphism card
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                
                // Glassmorphism card (without blur)
                Card(
                  color: const Color.fromARGB(255, 68, 225, 186), // Keep the green shade with same opacity
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Column(
                      children: const [
                        Text(
                          'Hi, I am Soul Voice!',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 11, 11, 11),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tell me, how can I help you?',
                          style: TextStyle(
                            fontSize: 20,
                             fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 6, 5, 5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Microphone icon with animated GIF (make it bigger)
                Gif(
                  autostart: Autostart.loop,
                  controller: controller,
                  placeholder: (context) => const Icon(CupertinoIcons.mic_circle_fill, size: 150), // Increase the size
                  image: const AssetImage('assets/mic.gif'),
                  height: 150, // Adjust the size as needed
                ),
                const SizedBox(height: 30),
                
                // Sound image
                SizedBox(
                  width: screenWidth * 0.8,
                  height: 100,
                  child: Image.asset(
                    'assets/sound.png', // Add the sound image
                    fit: BoxFit.contain,
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
