//splash_screen.dart
//...
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo/widget_tree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Widget _splashScreen() {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.1, 0.9],
        colors: [
          Color(0xFFFC5C7D),
          Color(0xFF6A82FB),
        ],
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 90.0),
    child: Image.asset(
      "images/logo/logo-white.png",
      fit: BoxFit.fitWidth,
    ),
  );
}

// Intermediate widget to call WidgetTree()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetTree(),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        runApp(
          const MaterialApp(
            home: AppScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _splashScreen();
  }
}

//...
