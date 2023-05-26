import 'package:flutter/material.dart';
import 'package:travo/models/checkin.dart';

import '../../widgets/image_view_wrapper.dart';
import '../out_of_service.dart';

class CheckInListingScreen extends StatelessWidget {
  CheckInListingScreen({super.key});

  CheckIn tmp = CheckIn(
      123,
      456,
      789,
      'Username',
      'Destination',
      'This is the status!!!',
      [Image.asset('assets/images/carousel/temp.png')]);

  Widget _content(info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.deepPurple,
                size: 28,
              ),
              Text(
                info.destination,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff333333)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  info.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(info.content),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkinCard(info) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ImageFullScreenWrapperWidget(
            child: info.image[0],
            dark: true,
          ),
          _content(info),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _checkinCard(tmp),
            ),
          ],
        ),
      ),
    );
  }
}
