


import 'loginmodel.dart';

//RegisterModel registerModelFromMap(String str) => RegisterModel.fromMap(json.decode(str));


class RegisterModel {
  RegisterModel({
    this.status,
    this.reason,
    this.customerId,
    this.userName,
    this.usertype,
    this.profile,
  });

  var status;
  var reason;
  var customerId;
  var userName;
  var usertype;
  Profile? profile;

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    reason: json["reason"],
    customerId: json["customer_id"],
    userName: json["user_name"],
    usertype: json["usertype"],
    profile: json["profile"] == null ? null : Profile.fromMap(json["profile"]),
  );

}
