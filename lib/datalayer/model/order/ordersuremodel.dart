// To parse this JSON data, do
//
//     final orderSure = orderSureFromMap(jsonString);

import 'dart:convert';

OrderSure orderSureFromMap(String str) => OrderSure.fromMap(json.decode(str));


class OrderSure {
  OrderSure({
    this.status,
    this.reason,
    this.customerId,
  });

  var status;
  var reason;
  var customerId;

  factory OrderSure.fromMap(Map<String, dynamic> json) => OrderSure(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
  );

}
