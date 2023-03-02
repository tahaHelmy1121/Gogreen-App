import 'dart:convert';

ForgetPassword forgetPasswordFromMap(String str) => ForgetPassword.fromMap(json.decode(str));


class ForgetPassword {
  var status;
  var reason;
  var customerId;
  var message;
  ForgetPassword({
    this.status,
    this.reason,
    this.customerId,
    this.message,
  });



  factory ForgetPassword.fromMap(Map<String, dynamic> json) => ForgetPassword(
    status: json["status"] == null ? null : json["status"],
    reason: json["reason"] == null ? null : json["reason"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    message: json["message"] == null ? null : json["message"],
  );


}
