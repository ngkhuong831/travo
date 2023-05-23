// ignore: unused_import
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travo/screens/listing_screen.dart';
import 'package:travo/screens/profile_screen.dart';
import 'package:travo/screens/setting_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User? user = Auth().currentUser;

  List<String> imgUrl = [
    "assets/images/carousel/carousel (1).jpg",
    "assets/images/carousel/carousel (2).jpg",
    "assets/images/carousel/carousel (3).jpg",
    "assets/images/carousel/carousel (4).jpg",
    "assets/images/carousel/carousel (5).jpg",
    "assets/images/carousel/carousel (6).jpg",
    "assets/images/carousel/carousel (7).jpg",
    "assets/images/carousel/carousel (8).jpg",
    "assets/images/carousel/carousel (9).jpg",
    "assets/images/carousel/carousel (10).jpg",
  ];

  List<String> categories = [
    "Entertainments",
    "Cuisine",
    "Cultural",
    "Historical",
    "Instagram-able",
    "Physical",
    "Mountainous",
    "Beaches",
  ];

  List<Color> themeCodes = [
    Color(0xffffadad),
    Color(0xffffd6a5),
    Color(0xffF9e698),
    Color(0xff0aa374),
    Color(0xff9bf6ff),
    Color(0xffa0c4ff),
    Color(0xffbdb2ff),
    Color(0xffffc6ff),
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void redirect(destination, context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination()),
    );
  }

  Widget _title() {
    return Text(
      'Travo',
      style: GoogleFonts.pacifico(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _Uid() {
    return Text(user?.email ?? 'User Email');
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
      padding: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.1,
        backgroundImage:
            AssetImage(user?.photoURL ?? "assets/images/notfound.png"),
      ),
    );
  }

  Widget _btn(name, Function() func) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: func,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(name),
        ),
      ),
    );
  }

  Widget _profileDrawer(context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ava(context),
            _displayName(),
            _Uid(),
            _btn("Sign Out", signOut),
            _btn(
              "Profile",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            _btn(
              "Settings",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _carousel(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.18,
          aspectRatio: 21 / 6,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: imgUrl.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _searchbar(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: SearchBar(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _categorycard(context, title, child) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.6,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListingScreen(
                      name: categories[index],
                      photoURL: "assets/images/categories/$index.png",
                      themeCode: themeCodes[index],
                    ),
                  ),
                );
              },
              child: _cardListItem(context, index))),
    );
  }

  Widget _cardListItem(context, index) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/categories/$index.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              padding: const EdgeInsets.all(12),
              child: Text(
                categories[index],
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _temp() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              _tempListItem(context, index)),
    );
  }

  Widget _tempListItem(context, index) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/carousel/carousel (1).jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              padding: const EdgeInsets.all(12),
              child: Text(
                "Temp $index",
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _profileDrawer(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        backgroundColor: Colors.transparent,
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _searchbar(context),
              _carousel(context),
              _categorycard(context, 'Category', _categoryList()),
              _categorycard(context, 'Recommendations', _temp()),
              _categorycard(context, 'Nearby', _temp()),
            ],
          ),
        ),
      ),
    );
  }
}
