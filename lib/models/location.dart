import 'dart:convert';

Location locationFromJson(String str) {
  Map<String, dynamic> data = jsonDecode(str);
  Location locations = Location.fromJson(data);
  return locations;
}

class Location {
  String? id;
  String? name;
  double? lat;
  double? lon;

  Location({this.id, this.name, this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
