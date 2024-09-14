import 'dart:ui'; // Import for ImageFilter.blur

import 'package:flutter/material.dart';

class Mood1Screen extends StatelessWidget {
  const Mood1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/mood_1.webp'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 5.0), // Apply blur to background
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0), // Transparent overlay
                ),
              ),
            ),
          ),

          // Centered black tray with text and emojis inside it
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 36, 36)
                    .withOpacity(0.5), // Black color with 50% opacity
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              padding:
                  const EdgeInsets.all(20.0), // Padding inside the black tray
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Margin to provide space on the sides
              child: const Column(
                mainAxisSize: MainAxisSize.min, // Minimize height to content
                children: [
                  // Text inside the black tray
                  Text(
                    "How are you feeling today?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20), // Space between the text and emojis

                  // Emojis as mood options inside the black tray
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20.0, // Space between emojis
                    runSpacing: 20.0, // Space between rows
                    children: [
                      EmojiWidget(emoji: "😊"), // Happy
                      EmojiWidget(emoji: "😰"), // Anxious
                      EmojiWidget(emoji: "😡"), // Angry
                      EmojiWidget(emoji: "😌"), //Relived
                      EmojiWidget(emoji: "😭"), // Crying
                      EmojiWidget(emoji: "😂"), // Laughing
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Skip button at the bottom-right corner
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Adds some space from the edges
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your skip button functionality here
                },
                icon: const Icon(Icons.arrow_forward,
                    color: Colors.black), // Icon with black color
                label: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black, // Black text for "Skip"
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 139, 38, 38), // Custom background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Widget for displaying an Emoji
class EmojiWidget extends StatelessWidget {
  final String emoji;

  const EmojiWidget({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle emoji tap event
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              Colors.white.withOpacity(0.9), // Optional background behind emoji
        ),
        alignment: Alignment.center,
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 40), // Emoji size
        ),
      ),
    );
  }
}
