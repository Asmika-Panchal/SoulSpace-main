import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soul/screens/homescreen.dart';
import 'package:soul/screens/mood1.dart';
import 'package:soul/screens/navigationscreen.dart';
import 'package:soul/screens/profile_view.dart';
import 'package:soul/screens/soulspace.dart';
import 'package:soul/screens/soulvoice_view.dart';
import 'package:soul/screens/statsscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return SoulBotHome(child: child); // Main shell with navbar
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const SoulHomeScreen(),
          ),
          GoRoute(
            path: '/chat',
            builder: (context, state) => const ChatScreen(),
          ),
          GoRoute(
            path: '/moods',
            builder: (context, state) => const Mood1Screen(),
          ),
          GoRoute(
            path: '/voice',
            builder: (context, state) => const SoulVoiceView(),
          ),
          GoRoute(
            path: '/stats',
            builder: (context, state) => const Statsscreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.activeBlue,
          fontFamily: 'MontserratAlternates'),
      routerConfig: _router,
    );
  }
}
