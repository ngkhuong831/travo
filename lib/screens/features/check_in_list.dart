import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo/models/checkin.dart';

import '../../widgets/image_view_wrapper.dart';
import '../out_of_service.dart';
import 'check_in_create.dart';

// ignore: must_be_immutable
class CheckInListingScreen extends StatelessWidget {
  CheckInListingScreen({super.key});

  CheckIn tmp = CheckIn(
    123,
    456,
    789,
    'Username',
    'Single Image Destination',
    'This is a CheckIn with one Image !!!',
    [
      Image.asset('assets/images/carousel/temp.png'),
    ],
    DateTime.now(),
  );

  CheckIn tmpList = CheckIn(
    123,
    456,
    789,
    'Username',
    'Multiple Images Destination',
    'This is a CheckIn with multiple images !!!',
    [
      Image.asset('assets/images/carousel/carousel (6).jpg'),
      Image.asset('assets/images/carousel/carousel (7).jpg'),
      Image.asset('assets/images/carousel/carousel (8).jpg'),
      Image.asset('assets/images/carousel/carousel (9).jpg'),
      Image.asset('assets/images/carousel/carousel (10).jpg'),
    ],
    DateTime.now(),
  );

  Widget _carousel(context, CheckIn list) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 1,
        enableInfiniteScroll: false,
        initialPage: 0,
        scrollDirection: Axis.horizontal,
      ),
      items: list.image.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ImageFullScreenWrapperWidget(
              dark: true,
              child: i,
            );
          },
        );
      }).toList(),
    );
  }

  Widget _content(CheckIn info) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.deepPurple,
              size: 26,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.destination,
                    softWrap: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff333333)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        info.content,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                info.created_at.toString(),
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xff999999),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _checkinCard(context, CheckIn info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  // Image slider
                  _carousel(context, info),
                  // if post has many images, show multi-image icon
                  (info.image.length > 1)
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0x33000000),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.copy_all,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _content(info),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addCheckIn(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckInCreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.edit, color: Colors.deepPurpleAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addCheckIn(context),
      appBar: AppBar(
        title: Text(
          "Check-Ins",
          style: GoogleFonts.pacifico(
            color: Color(0xff333333),
          ),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _checkinCard(context, tmp),
              _checkinCard(context, tmpList),
            ],
          ),
        ),
      ),
    );
  }
}
