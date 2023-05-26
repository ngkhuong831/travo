import 'package:flutter/material.dart';

class OutOfServiceScreen extends StatelessWidget {
  const OutOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/noservice.png"),
            const Text(
              'Coming Soon...',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w900,
                fontSize: 32.0,
              ),
            ),
            const Text(
              "This hasn't been complete yet or is under maintenance.",
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
