import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For setting status bar
import 'package:soul/screens/mood3.dart';

class Mood2Screen extends StatefulWidget {
  const Mood2Screen({super.key});

  @override
  State<Mood2Screen> createState() => _Mood2ScreenState();
}

class _Mood2ScreenState extends State<Mood2Screen> {
  String selectedFeel = ""; // Variable to store selected mood

  @override
  void initState() {
    super.initState();
    // Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.light, // White icons on the status bar
    ));
  }

  // Function to handle mood selection
  void onFeelSelected(String mood) {
    setState(() {
      selectedFeel = mood; // Update the selected mood
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend behind the app bar
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.chevron_back)),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove shadow
      ),
      body: Stack(
        children: [
          // Background Image with Darker Blur Effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/mood_2.jpg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // Apply blur
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3), // Dark overlay
                ),
              ),
            ),
          ),
          // Main content - Column with top text and mood buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tray (Black Rectangle)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 18.0),
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
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20.0,
                          runSpacing: 20.0,
                          children: [
                            MoodButton(
                                text: 'Relation',
                                isSelected: selectedFeel == 'Relation',
                                onFeelSelected: onFeelSelected),
                            MoodButton(
                                text: 'Family',
                                isSelected: selectedFeel == 'Family',
                                onFeelSelected: onFeelSelected),
                            MoodButton(
                                text: 'Food',
                                isSelected: selectedFeel == 'Food',
                                onFeelSelected: onFeelSelected),
                            MoodButton(
                                text: 'Exercise',
                                isSelected: selectedFeel == 'Exercise',
                                onFeelSelected: onFeelSelected),
                            MoodButton(
                                text: 'Learning',
                                isSelected: selectedFeel == 'Learning',
                                onFeelSelected: onFeelSelected),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50), // Space outside the rectangle
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
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
          // Skip button at the bottom-left corner
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).size.height * 0.12),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mood3Screen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFC4E875),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
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
                padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: MediaQuery.of(context).size.height * 0.12),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mood3Screen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff7cf6ad),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 10),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.black),
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
  final Function(String) onFeelSelected;

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
        onFeelSelected(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 3, 57, 133)
              : Colors.transparent,
          border: Border.all(
            color: const Color.fromARGB(255, 130, 127, 127).withOpacity(0.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
