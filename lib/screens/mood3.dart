import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:soul/screens/homescreen.dart';

class Mood3Screen extends StatefulWidget {
  const Mood3Screen({super.key});

  @override
  State<Mood3Screen> createState() => _Mood3ScreenState();
}

class _Mood3ScreenState extends State<Mood3Screen> {
  String selectedTrigger = "";

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void onTriggerSelected(String mood) {
    setState(() {
      selectedTrigger = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mood_3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "What are Your Top Triggers?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20.0,
                          runSpacing: screenHeight * 0.02,
                          children: [
                            MoodButton(
                              text: 'Conflict',
                              isSelected: selectedTrigger == 'Conflict',
                              onTriggerSelected: onTriggerSelected,
                            ),
                            MoodButton(
                              text: 'Stress',
                              isSelected: selectedTrigger == 'Stress',
                              onTriggerSelected: onTriggerSelected,
                            ),
                            MoodButton(
                              text: 'Food',
                              isSelected: selectedTrigger == 'Food',
                              onTriggerSelected: onTriggerSelected,
                            ),
                            MoodButton(
                              text: 'Work',
                              isSelected: selectedTrigger == 'Work',
                              onTriggerSelected: onTriggerSelected,
                            ),
                            MoodButton(
                              text: 'Family',
                              isSelected: selectedTrigger == 'Family',
                              onTriggerSelected: onTriggerSelected,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.12),
                if (selectedTrigger.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Selected: $selectedTrigger',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16, bottom: screenHeight * 0.12), // Dynamic bottom padding
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.black),
                label: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC4E875),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ),
          if (selectedTrigger.isNotEmpty)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 16, bottom: screenHeight * 0.12), // Dynamic bottom padding
                child: InkWell(
                  onTap: () {
                    context.go('/home');
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

class MoodButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String) onTriggerSelected;

  const MoodButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTriggerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTriggerSelected(text);
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
