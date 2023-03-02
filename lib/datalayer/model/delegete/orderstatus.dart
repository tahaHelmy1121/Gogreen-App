
import 'dart:convert';

DelegateOrderStatus delegateOrderStatusFromMap(String str) => DelegateOrderStatus.fromMap(json.decode(str));


class DelegateOrderStatus {
  DelegateOrderStatus({
    this.status,
    this.reason,
  });

  var status;
  var reason;

  factory DelegateOrderStatus.fromMap(Map<String, dynamic> json) => DelegateOrderStatus(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
  );


}
