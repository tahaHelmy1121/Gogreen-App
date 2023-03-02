

import 'dart:convert';

List<Addresses> addressesFromMap(String str) => List<Addresses>.from(json.decode(str).map((x) => Addresses.fromMap(x)));


class Addresses {
  Addresses({
    this.id,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.governorateId,
    this.regionId,
    this.governorateName,
    this.regionName,
    this.districtName,
    this.districtId,
    this.customerId,
    this.mobile,
    this.latitude,
    this.longitude
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
  var districtName;
  var districtId;
  var customerId;
  var mobile;
  var longitude;
  var latitude;

  factory Addresses.fromMap(Map<String, dynamic> json) => Addresses(
    id: json["id"],
    streetAddress: json["street_address"],
    specialMarque: json["special_marque"],
    buildingNumber: json["building_number"],
    roleNumber: json["role_number"],
    governorateId: json["governorate_id"],
    regionId: json["region_id"],
    governorateName: json["governorate_name"],
    regionName: json["region_name"],
    districtName: json["district_name"],
    districtId: json["district_id"],
    customerId: json["customer_id"],
    mobile: json["mobile"],
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
  );

}
