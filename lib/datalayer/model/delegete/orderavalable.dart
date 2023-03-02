
import 'dart:convert';

List<OrderAvailableModel> orderAvailableModelFromMap(String str) => List<OrderAvailableModel>.from(json.decode(str).map((x) => OrderAvailableModel.fromMap(x)));


class OrderAvailableModel {
  OrderAvailableModel({
    this.orderId,
    this.customerId,
    this.customerName,
    this.customerMobile,
    this.addressId,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.longitude,
    this.latitude,
    this.fullTotal,
    this.createDateTime,
    this.regionId,
    this.regionName,
    this.districtname,
  });

  var orderId;
  var customerId;
  var customerName;
  var customerMobile;
  var addressId;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  var longitude;
  var latitude;
  var fullTotal;
  DateTime? createDateTime;
  var regionId;
  var regionName;
  var districtname;

  factory OrderAvailableModel.fromMap(Map<String, dynamic> json) => OrderAvailableModel(
    orderId: json["order_id"],
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    customerMobile: json["customer_mobile"],
    addressId: json["address_id"],
    streetAddress: json["street_address"],
    specialMarque: json["special_marque"],
    buildingNumber: json["building_number"],
    roleNumber: json["role_number"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    fullTotal: json["full_total"],
    createDateTime: json["create_date_time"] == null ? null : DateTime.parse(json["create_date_time"]),
    regionId: json["region_id"],
    regionName: json["region_name"],
    districtname: json["districtname"],
  );


}
