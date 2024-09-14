import 'dart:ui';

import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/question.webp'), // Background image
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Blur effect
              child: Container(
                color:
                    Colors.black.withOpacity(0.3), // Adjust opacity as needed
              ),
            ),
          ),

          // Content on top of the blurred background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adjusted Padding for the Heading
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                  child: Text(
                    'Getting to Know You!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Scrollable content starts here
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildQuestionTray('What is your name?'),
                        const SizedBox(height: 15),
                        _buildQuestionTray('What is your age?'),
                        const SizedBox(height: 15),
                        _buildQuestionTray('What makes you feel happy?'),
                        const SizedBox(height: 15),
                        _buildQuestionTray('What topics should I avoid?'),
                        const SizedBox(height: 15),
                        _buildQuestionTray('What inspires you the most?'),
                        const SizedBox(height: 15),
                        _buildQuestionTray(
                            'What mindfulness practices work for you?'),
                        const SizedBox(height: 50), // Space at the bottom
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionTray(String question) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0)
            .withOpacity(0.7), // Tray background
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter your answer here',
            ),
          ),
        ],
      ),
    );
  }
}
