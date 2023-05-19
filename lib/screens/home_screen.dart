import 'package:firebase_auth/firebase_auth.dart';
import 'package:travo/auth/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('TravoVN');
  }

  Widget _Uid() {
    return Text(user?.email ?? 'User Email');
  }

  Widget _signOutBtn() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          _Uid(),
          _signOutBtn(),
        ]),
      ),
    );
  }
}
