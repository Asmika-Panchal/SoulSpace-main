import 'dart:ui'; // Required for ImageFilter.blur

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image with blur
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/login.webp'), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          // Semi-transparent overlay to blur the image slightly
          Container(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          ),
          // Login form
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Icon
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 92, 49, 98),
                    radius: 35,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  // Login Text
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email field
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.email,
                          color: Color.fromARGB(221, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password field
                  TextField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(204, 248, 248, 248)),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Remember Me checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                        activeColor: const Color.fromARGB(255, 107, 26, 121),
                      ),
                      const Text('Remember Me',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5C166E),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 95.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Google Sign In button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Image.asset(
                        'assets/google.png', // Replace with your Google logo
                        height: 28.0,
                        width: 30.0,
                      ),
                      onPressed: () {},
                      label: const Text('Sign in with Google',
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Register link
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Don't have an account? REGISTER HERE",
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
