import 'dart:ui';
import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/question.webp'), // Background image
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Blur effect
              child: Container(
                color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
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
                        SizedBox(height: 15),
                        _buildQuestionTray('What is your age?'),
                        SizedBox(height: 15),
                        _buildQuestionTray('What makes you feel happy?'),
                        SizedBox(height: 15),
                        _buildQuestionTray('What topics should I avoid?'),
                        SizedBox(height: 15),
                        _buildQuestionTray('What inspires you the most?'),
                        SizedBox(height: 15),
                        _buildQuestionTray('What mindfulness practices work for you?'),
                        SizedBox(height: 50), // Space at the bottom
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7), // Tray background
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
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
