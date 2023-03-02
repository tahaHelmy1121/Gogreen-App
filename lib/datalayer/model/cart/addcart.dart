

import 'dart:convert';

AddCartModel addCartFromMap(String str) => AddCartModel.fromMap(json.decode(str));


class AddCartModel {
  AddCartModel({
    this.status,
    this.reason,
    this.totalCart,
    this.totalPoints,
    this.totalQuantity,
    this.minQuantity,
    this.availableQuantity,
  });

  var status;
  var reason;
  var totalCart;
  var totalPoints;
  var totalQuantity;
  var minQuantity;
  var availableQuantity;

  factory AddCartModel.fromMap(Map<String, dynamic> json) => AddCartModel(
    status: json["status"],
    reason: json["reason"],
    totalCart: json["total_cart"],
    totalPoints: json["total_points"],
    totalQuantity: json["total_quantity"],
    minQuantity: json["min_quantity"],
    availableQuantity: json["available_quantity"],
  );


}
