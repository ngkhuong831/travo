import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travo/auth/auth.dart';

import 'features/booking.dart';
import 'features/check_in_list.dart';
import 'features/editor.dart';
import 'features/tour_planner.dart';

class NavItem {
  late String name;
  late Widget widget;

  NavItem(this.name, this.widget); // Constructor

  String getName() {
    return this.name;
  }

  Widget getWidget() {
    return this.widget;
  }
}

List<NavItem> navList = [
  NavItem(
    "Check-ins",
    CheckInListingScreen(),
  ),
  NavItem(
    "Tour Planner",
    TourPlanner(),
  ),
  NavItem(
    "My Bookings",
    BookingScreen(),
  ),
  NavItem(
    "Image/Video Editor",
    MediaEditor(),
  ),
];

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User? user = Auth().currentUser;

  Widget _Uid() {
    return Text(
      user?.email ?? 'User Email',
      overflow: TextOverflow.clip,
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

  Widget _navList(context, screens) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: screens.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(screens[index].name),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return screens[index].widget;
                  }));
                },
              );
            }),
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
      body: SingleChildScrollView(
        child: Column(
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
            _contentCard(context, _navList(context, navList))
          ],
        ),
      ),
    );
  }
}
