
import 'dart:convert';

RemoveAddress removeAddressFromMap(String str) => RemoveAddress.fromMap(json.decode(str));

class RemoveAddress {
  RemoveAddress({
    this.status,
    this.reason,
  });

  var status;
  var reason;

  factory RemoveAddress.fromMap(Map<String, dynamic> json) => RemoveAddress(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
  );


}
