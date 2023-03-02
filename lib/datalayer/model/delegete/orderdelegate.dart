

import 'dart:convert';

List<DelegateOrder> delegateOrderFromMap(String str) => List<DelegateOrder>.from(json.decode(str).map((x) => DelegateOrder.fromMap(x)));


class DelegateOrder {
  DelegateOrder({
    this.id,
    this.customerId,
    this.name,
    this.phone,
    this.addressId,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.governoratename,
    this.regionname,
    this.districtname,
    this.longitude,
    this.latitude,
    this.orderTotal,
    this.shippingCost,
    this.fullTotal,
    this.orderPoint,
    this.payType,
    this.createDateTime,
    this.orderStatus,
    this.orderStatustext,
    this.taxValue,
    this.orderstatusDate,
    this.tackorderDate,
  });

  var id;
  var customerId;
  var name;
  var phone;
  var addressId;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  var governoratename;
  var regionname;
  var districtname;
  var longitude;
  var latitude;
  var orderTotal;
  var shippingCost;
  var fullTotal;
  var orderPoint;
  var payType;
  DateTime? createDateTime;
  var orderStatus;
  var orderStatustext;
  var taxValue;
  var orderstatusDate;
  var tackorderDate;

  factory DelegateOrder.fromMap(Map<String, dynamic> json) => DelegateOrder(
    id: json["id"] == null ? null : json["id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    name:json["name"] == null ? null : json["name"],
    phone:json["phone"] == null ? null : json["phone"],
    addressId: json["address_id"] == null ? null : json["address_id"],
    streetAddress: json["street_address"] == null ? null : json["street_address"],
    specialMarque: json["special_marque"] == null ? null : json["special_marque"],
    buildingNumber: json["building_number"] == null ? null : json["building_number"],
    roleNumber: json["role_number"] == null ? null : json["role_number"],
    governoratename: json["governoratename"] == null ? null : json["governoratename"],
    regionname: json["regionname"] == null ? null : json["regionname"],
    districtname: json["districtname"] == null ? null : json["districtname"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    orderTotal: json["order_total"] == null ? null : json["order_total"],
    shippingCost: json["shipping_cost"] == null ? null :json["shipping_cost"],
    fullTotal: json["full_total"] == null ? null : json["full_total"],
    orderPoint: json["order_point"] == null ? null : json["order_point"],
    payType: json["pay_type"] == null ? null : json["pay_type"],
    createDateTime: json["create_date_time"] == null ? null : DateTime.parse(json["create_date_time"]),
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    orderStatustext: json["order_statustext"] == null ? null : json["order_statustext"],
    taxValue: json["tax_value"] == null ? null : json["tax_value"],
    orderstatusDate: json["orderstatus_date"],
    tackorderDate: json["tackorder_date"],
  );

}
