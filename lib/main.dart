// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/login.dart';
import 'package:soul/screens/mood1.dart';
import 'package:soul/screens/mood2.dart';
import 'package:soul/screens/mood3.dart';
import 'package:soul/screens/navigationscreen.dart';
import 'package:soul/screens/question.dart';
import 'package:soul/screens/reminder.dart';
import 'package:soul/screens/signup.dart';
import 'package:soul/screens/soulvoice_view.dart';

//Start Point, to run app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.activeBlue,
          fontFamily: 'MontserratAlternates'),
      home: SoulBotHome(),
      // home: const Mood1Screen(),
      // home: const Mood2Screen(),
      // home: const Mood3Screen(),
      // home: const LoginScreen(),
      // home: SignUpScreen(),
      // home: ReminderScreen(),
      // home: Questions(),
      //Here call the screen you want to
    );
  }
}
