

import 'dart:convert';

UpdateProfile updateProfileFromMap(String str) => UpdateProfile.fromJson(json.decode(str));
class UpdateProfile {
  int? status;
  String? reason;

  UpdateProfile({this.status, this.reason});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    return data;
  }
}
