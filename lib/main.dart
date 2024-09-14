import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/signup.dart';
import 'package:soul/login.dart';
import 'package:soul/mood1.dart';
import 'package:soul/mood2.dart';
import 'package:soul/mood3.dart';
import 'package:soul/question.dart';
import 'package:soul/reminder.dart';
import 'package:soul/soulvoice_view.dart';
import 'package:soul/soulspace.dart';
import 'package:soul/profile_view.dart';

//Start Point, to run app
void main() {
  runApp(MyApp());
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
      ),
      home: ProfileScreen(),
      //Here call the screen you want to
    );
  }
}
