import 'dart:ui'; // Import this for the ImageFilter.blur

import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    'assets/signup.webp'), // Make sure the image is in assets
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Blur effect
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Adjust the overlay color and opacity
                ),
              ),
            ),
          ),

          // Sign-up Form UI
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon or Avatar at the top
                  const CircleAvatar(
                    radius: 37.0,
                    backgroundColor: Color.fromARGB(195, 155, 148, 148),
                    child: Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 34.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Title
                  const Text(
                    'Sign-Up',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 22.0),

                  // Full Name TextField
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      hintText: 'Enter your Full Name',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: const Color.fromARGB(169, 26, 14, 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Email TextField
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      hintText: 'Enter your E-mail Id',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: const Color.fromARGB(169, 26, 14, 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Password TextField
                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      hintText: 'Create a strong password',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: const Color.fromARGB(169, 26, 14, 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Register Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 95.0),
                      backgroundColor: const Color(0xFF5C166E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Register',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.white70)),
                  ),

                  const SizedBox(height: 20.0),

                  // Continue with Google
                  const Text('Or', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 12.0, width: 18.0),

                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/google.png', // Replace arrow with google.png
                      height: 28.0,
                      width: 30.0,
                    ),
                    label: const Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // Login Text
                  const SizedBox(height: 24.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Already have account? LOGIN',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
