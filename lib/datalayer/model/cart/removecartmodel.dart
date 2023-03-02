

import 'dart:convert';

RemoveCartModel removeCartModelFromMap(String str) => RemoveCartModel.fromMap(json.decode(str));


class RemoveCartModel {
  RemoveCartModel({
    this.status,
    this.reason,
  });

  var status;
  var reason;

  factory RemoveCartModel.fromMap(Map<String, dynamic> json) => RemoveCartModel(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
  );


}