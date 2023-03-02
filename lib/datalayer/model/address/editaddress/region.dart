
import 'dart:convert';

List<Region> regionsFromMap(String str) =>
    List<Region>.from(json.decode(str).map((x) => Region.fromJson(x)));
class Region {
  int? id;
  String? name;
  int? governorateId;

  Region({this.id, this.name, this.governorateId});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    governorateId = json['governorate_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['governorate_id'] = this.governorateId;
    return data;
  }
}
