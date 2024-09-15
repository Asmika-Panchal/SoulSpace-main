import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/mood3.dart';

class Mood2Screen extends StatefulWidget {
  const Mood2Screen({super.key});

  @override
  State<Mood2Screen> createState() => _Mood2ScreenState();
}

class _Mood2ScreenState extends State<Mood2Screen> {
  String selectedFeel = ""; // Variable to store selected mood

  // Function to handle mood selection
  void onFeelSelected(String mood) {
    setState(() {
      selectedFeel = mood; // Update the selected mood
    });
  }

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
                image: AssetImage('assets/mood_2.webp'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Apply blur to background
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tray (Black Rectangle)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20), // Adds margin around the black tray
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // Black color with 50% opacity
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "What makes you feel good?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0), // Margin to space between text and mood options
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20.0, // Space between buttons
                          runSpacing: 20.0, // Space between rows
                          children: [
                            MoodButton(text: 'Relation', isSelected: selectedFeel == 'Relation', onFeelSelected: onFeelSelected),
                            MoodButton(text: 'Family', isSelected: selectedFeel == 'Family', onFeelSelected: onFeelSelected),
                            MoodButton(text: 'Food', isSelected: selectedFeel == 'Food', onFeelSelected: onFeelSelected),
                            MoodButton(text: 'Exercise', isSelected: selectedFeel == 'Exercise', onFeelSelected: onFeelSelected),
                            MoodButton(text: 'Learning', isSelected: selectedFeel == 'Learning', onFeelSelected: onFeelSelected),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50), // Space outside the rectangle
                // Selected Mood Display
                if (selectedFeel.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Selected: $selectedFeel',
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
          // Skip button at the bottom-left corner
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adds some space from the edges
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mood3Screen(), // Navigate to Mood3Screen
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 146, 64), // Custom background color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward, color: Colors.black), // Icon with black color
                      SizedBox(width: 8),
                      Text(
                        "Skip",
                        style: TextStyle(color: Colors.black), // Black text for "Skip"
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Next button at the bottom-right corner
          if (selectedFeel.isNotEmpty)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adds some space from the edges
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mood3Screen(), // Navigate to Mood3Screen
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 220, 235), // Custom background color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), // Text for "Next"
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.black), // Icon with black color
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

// Custom Widget for displaying a Mood Button
class MoodButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String) onFeelSelected; // Callback for mood selection

  const MoodButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onFeelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onFeelSelected(text); // Trigger the callback with the selected mood
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 54, 220, 235)
              : Colors.transparent, // Transparent background for unselected
          border: Border.all(
            color: const Color.fromARGB(255, 130, 127, 127).withOpacity(0.5), // Slightly black border for unselected buttons
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
