

import 'dart:convert';

AddressOne addresOneFromMap(String str) => AddressOne.fromMap(json.decode(str));


class AddressOne {
  AddressOne({
    this.id,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.governorateId,
    this.regionId,
    this.governorateName,
    this.regionName,
    this.districtId,
    this.districtName,
    this.longitude,
    this.latitude,
  });

  var id;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  var governorateId;
  var regionId;
  var governorateName;
  var regionName;
  var districtId;
  var districtName;
  var longitude;
  var latitude;

  factory AddressOne.fromMap(Map<String, dynamic> json) => AddressOne(
    id: json["id"],
    streetAddress: json["street_address"],
    specialMarque: json["special_marque"],
    buildingNumber: json["building_number"],
    roleNumber: json["role_number"],
    governorateId: json["governorate_id"],
    regionId: json["region_id"],
    governorateName: json["governorate_name"],
    regionName: json["region_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
  );


}
