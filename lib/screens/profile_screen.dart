import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travo/auth/auth.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User? user = Auth().currentUser;

  Widget _Uid() {
    return Text(
      user?.email ?? 'User Email',
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _displayName() {
    return Text(
      user?.displayName ?? 'Username',
      style: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.w900,
        fontSize: 32.0,
      ),
    );
  }

  Widget _ava(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.1,
        backgroundImage:
            AssetImage(user?.photoURL ?? "assets/images/notfound.png"),
      ),
    );
  }

  Widget _contentCard(context, child) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        child: Padding(padding: const EdgeInsets.all(10.0), child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _ava(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _displayName(),
                  _Uid(),
                ],
              )
            ],
          ),
          _contentCard(context, const Text('data'))
        ],
      ),
    );
  }
}
