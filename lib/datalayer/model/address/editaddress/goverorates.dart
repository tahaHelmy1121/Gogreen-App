

import 'dart:convert';

List<Governorates> governoratesFromMap(String str) => List<Governorates>.from(json.decode(str).map((x) => Governorates.fromMap(x)));


class Governorates {
  Governorates({
    this.id,
    this.name,
  });

  var id;
  var name;
  factory Governorates.fromMap(Map<String, dynamic> json) => Governorates(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );


}
