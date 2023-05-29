import 'package:flutter/material.dart';

class CheckIn {
  late int id;
  late int uid;
  late int did;
  late String username;
  late String destination;
  late String content;
  late List<Image> image;
  late DateTime created_at;

  CheckIn(this.id, this.uid, this.did, this.username, this.destination,
      this.content, this.image, this.created_at);
}
