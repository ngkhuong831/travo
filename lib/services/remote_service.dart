import 'package:http/http.dart' as http;

import '../models/location.dart';

class RemoteService {
  Future<Location?> getLocation() async {
    var client = http.Client();

    var url = Uri.parse('https://placesvnapi-1-y0432477.deta.app');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return locationFromJson(json);
    }
  }
}
