import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travo/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCEjaj7KkWUUidau16D1wkskoDdKO-WgGU", // Your apiKey
      appId: "978146309733", // Your appId
      messagingSenderId: "978146309733", // Your messagingSenderId
      projectId: "fir-auth-37000", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
