// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));


class LoginModel {
  LoginModel({
    this.status,
    this.reason,
    this.userId,
    this.profile,
    this.usertype,
  });

  var status;
  var reason;
  var userId;
  Profile? profile;
  var usertype;

  factory LoginModel.fromMap(Map<String, dynamic> json) =>
      LoginModel(
        status: json["status"],
        reason: json["reason"],
        userId: json["user_id"],
        profile: json["profile"] == null ? null : Profile.fromMap(
            json["profile"]),
        usertype: json["usertype"],
      );

}

class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.mobile,
    this.groupId,
    this.code,
    this.image,
  });

  var id;
  var firstName;
  var lastName;
  var userName;
  var email;
  var mobile;
  var groupId;
  var code;
  var image;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userName: json["user_name"],
    email: json["email"],
    mobile: json["mobile"],
    groupId: json["group_id"],
    code: json["code"],
    image: json["image"],
  );


}
