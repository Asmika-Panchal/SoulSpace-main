import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
    ));

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Container()),
    );
  }
}
