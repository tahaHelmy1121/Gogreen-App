


import 'dart:convert';

List<Districts> districtsFromMap(String str) => List<Districts>.from(json.decode(str).map((x) => Districts.fromJson(x)));


class Districts {
       int? id;
       String? name;
       int? regionId;

       Districts({this.id, this.name, this.regionId});

       Districts.fromJson(Map<String, dynamic> json) {
              id = json['id'];
              name = json['name'];
              regionId = json['region_id'];
       }

       Map<String, dynamic> toJson() {
              final Map<String, dynamic> data = new Map<String, dynamic>();
              data['id'] = this.id;
              data['name'] = this.name;
              data['region_id'] = this.regionId;
              return data;
       }
}
