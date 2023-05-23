import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo/screens/detail_screen.dart';

// ignore: must_be_immutable
class ListingScreen extends StatelessWidget {
  ListingScreen({
    super.key,
    required this.name,
    required this.photoURL,
    required this.themeCode,
  });

  String name;
  String photoURL;
  Color themeCode;

  Widget _background(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset(photoURL).image, fit: BoxFit.fill),
      ),
    );
  }

  Widget _name(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: themeCode,
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            Text(
              name,
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _listBuilder(context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _listItem(context, index);
        });
  }

  Widget _listItem(context, index) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen()),
          );
        },
        leading: const Icon(Icons.list),
        trailing: Text(
          "Travo",
          style: GoogleFonts.pacifico(
            color: themeCode,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text("List item $index"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _background(context),
            _name(context),
            _listBuilder(context),
          ],
        ),
      ),
    );
  }
}
