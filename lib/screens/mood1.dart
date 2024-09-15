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
  String selectedMood = '--select--'; // Default mood with both emoji and label

  final List<String> moods = [
    '--select--',
    '😊 Happy',
    '😢 Sad',
    '😠 Angry',
    '😌 Relieved',
    '😂 Laughing',
    '😭 Crying',
    '😰 Anxious',
    '😡 Enraged',
    '😐 Neutral',
    '😫 Tired',
    '😨 Fearful',
    '😤 Frustrated',
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

          // Centered black tray with text and dropdown menu inside it
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
                  const SizedBox(
                      height: 20), // Space between the text and dropdown

                  // Dropdown menu for mood selection
                  DropdownButton<String>(
                    value: selectedMood,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)), // Rounded corners
                    dropdownColor: const Color.fromARGB(
                        255, 45, 36, 36), // Background color of dropdown
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Improved font style
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white, // Custom icon color
                      size: 28, // Larger icon size
                    ),
                    underline: Container(
                      height: 2,
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // Custom underline color
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMood = newValue!;
                      });
                    },
                    items: moods.map<DropdownMenuItem<String>>((String mood) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center, // Centered text
                        value: mood,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0), // Padding inside dropdown
                          child: Text(
                            mood,
                            style: const TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16, // Text size
                              fontWeight: FontWeight
                                  .bold, // Bold text for better appearance
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // Skip button at the bottom-left corner with InkWell
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Adds some space from the edges
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Mood2Screen(), // Navigate to Mood2Screen
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 146, 64), // Custom background color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward,
                          color: Colors.black), // Icon with black color
                      SizedBox(width: 8),
                      Text(
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

          // Next button at the bottom-right corner with InkWell
          if (selectedMood != '--select--')
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(16.0), // Adds some space from the edges
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Mood2Screen(), // Navigate to Mood2Screen
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 220, 235), // Custom background color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward,
                            color: Colors.black), // Icon with black color
                        SizedBox(width: 8),
                        Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black, // Black text for "Next"
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
