import 'dart:ui'; // Import for ImageFilter.blur

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/mood2.dart';

class Mood1Screen extends StatefulWidget {
  const Mood1Screen({super.key});

  @override
  _Mood1ScreenState createState() => _Mood1ScreenState();
}

class _Mood1ScreenState extends State<Mood1Screen> {
  String selectedMood = '😊 Happy'; // Default mood with both emoji and label

  final List<String> moods = [
    '😊 Happy',
    '😢 Sad',
    '😠 Angry',
    '😌 Relieved',
    '😂 Laughing',
    '😭 Crying',
    '😰 Anxious',
    '😡 Frustrated',
    // Add more moods as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.chevron_back)),
      ),
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mood_1.webp'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur to background
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0), // Transparent overlay
                ),
              ),
            ),
          ),

          // Centered black tray with text and dropdown menu inside it
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 36, 36).withOpacity(0.5), // Black color with 50% opacity
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              padding: const EdgeInsets.all(20.0), // Padding inside the black tray
              margin: const EdgeInsets.symmetric(horizontal: 20.0), // Margin to provide space on the sides
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize height to content
                children: [
                  // Text inside the black tray
                  const Text(
                    "How are you feeling today?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20), // Space between the text and dropdown

                  // Dropdown menu for mood selection
                  DropdownButton<String>(
                    value: selectedMood,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMood = newValue!;
                      });
                    },
                    items: moods.map((String mood) {
                      return DropdownMenuItem<String>(
                        value: mood,
                        child: Text(
                          mood,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    dropdownColor: const Color.fromARGB(255, 45, 36, 36), // Dropdown background color
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Skip button at the bottom-right corner with InkWell
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adds some space from the edges
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mood2Screen(), // Navigate to Mood2Screen
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 139, 38, 38), // Custom background color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_forward, color: Colors.black), // Icon with black color
                      const SizedBox(width: 8),
                      const Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.black, // Black text for "Skip"
                        ),
                      ),
                    ],
                  ),
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
