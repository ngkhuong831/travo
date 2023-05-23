import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text(
          "v.1.0.1.\nDeveloped by NguyenKhuong.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
