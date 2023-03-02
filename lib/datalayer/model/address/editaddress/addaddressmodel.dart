

import 'dart:convert';

AddAddressModel addAddressModelFromMap(String str) => AddAddressModel.fromMap(json.decode(str));


class AddAddressModel {
    AddAddressModel({
        this.status,
        this.reason,
    });

    var status;
    var reason;

    factory AddAddressModel.fromMap(Map<String, dynamic> json) => AddAddressModel(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
    );


}
