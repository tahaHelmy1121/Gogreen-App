
import 'dart:convert';

UpdateAddress updateAddressFromMap(String str) => UpdateAddress.fromMap(json.decode(str));


class UpdateAddress {
  UpdateAddress({
    this.status,
    this.reason,
  });

  var status;
  var reason;

  factory UpdateAddress.fromMap(Map<String, dynamic> json) => UpdateAddress(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
  );


}
