import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/mood3.dart';

class Mood2Screen extends StatelessWidget {
  const Mood2Screen({super.key});

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
                    'assets/mood_2.webp'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3.0, sigmaY: 3.0), // Apply blur to background
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0), // Transparent overlay
                ),
              ),
            ),
          ),
          // Transparent overlay to slightly darken the image for contrast
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Main content - Column with top text and mood buttons
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 20), // Adds margin around the black tray
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.5), // Black color with 50% opacity
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Semi-transparent rectangle with the text (Top center)
                  Text(
                    "What makes you feel good?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 30), // Space between text and mood options

                  // Mood buttons as options
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20.0, // Space between buttons
                    runSpacing: 20.0, // Space between rows
                    children: [
                      MoodButton(text: 'Relation'),
                      MoodButton(
                          text: 'Family',
                          isSelected:
                              true), // Selected button has different style
                      MoodButton(text: 'Food'),
                      MoodButton(text: 'Exercise'),
                      MoodButton(text: 'Learning'),
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

// Custom Widget for displaying a Mood Button
class MoodButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MoodButton({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 223, 205, 125)
              : const Color.fromARGB(
                  0, 96, 93, 93), // Transparent background for unselected
          border: Border.all(
            color: const Color.fromARGB(255, 130, 127, 127).withOpacity(
                0.5), // Slightly black border for unselected buttons
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Keep transparent background
            shadowColor: Colors.transparent, // No shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            // Handle button press
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // White text
              fontSize: 16,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Mood3Screen()),
        );
      },
    );
  }
}
