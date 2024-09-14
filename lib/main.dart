import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/navigationscreen.dart';

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
          fontFamily: 'Alice'),
      home: const SoulBotHome(),
      //Here call the screen you want to
    );
  }
}
