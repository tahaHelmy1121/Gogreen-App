import 'dart:convert';

TackOrder tackOrderFromMap(String str) => TackOrder.fromMap(json.decode(str));


class TackOrder {
  TackOrder({
    this.status,
    this.reason,
  });

  var status;
  var reason;

  factory TackOrder.fromMap(Map<String, dynamic> json) => TackOrder(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
  );


}
