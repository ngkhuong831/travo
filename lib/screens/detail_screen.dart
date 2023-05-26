import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travo/screens/features/navigation.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  String lipsum =
      "\nLorem ipsum dolor sit amet. Nam pariatur sint qui ipsam sunt qui vitae inventore ut ipsum quisquam sit dolor voluptatem et quasi eligendi ut tenetur facilis. A veniam culpa et reprehenderit iure et nostrum amet ea itaque suscipit!";
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

  Widget _carousel(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.25,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
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

  Widget _infoCard(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Destination',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'N\\A',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(lipsum),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _FAB(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapScreen()),
          );
        },
        label: Text('Let\s Go!!!'),
        icon: Icon(Icons.edit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _FAB(context),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Placeholder'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _carousel(context),
            _infoCard(context),
          ],
        ),
      ),
    );
  }
}
