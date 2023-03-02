
import 'dart:convert';

Profile profileFromMap(String str) => Profile.fromJson(json.decode(str));

class Profile {
  var id;
  var name;
  var userEmail;
  var mobile;
  var userRegistrationDatetime;
  var defaultAddressId;
  var userPasswordHash;
  var sId;
  var code;
  var usertype;
  DefaultAddress? defaultAddress;

  Profile(
      {this.id,
        this.name,
        this.userEmail,
        this.mobile,
        this.userRegistrationDatetime,
        this.defaultAddressId,
        this.userPasswordHash,
        this.sId,
        this.code,
        this.usertype,
        this.defaultAddress});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userEmail = json['user_email'];
    mobile = json['mobile'];
    userRegistrationDatetime = json['user_registration_datetime'];
    defaultAddressId = json['default_address_id'];
    userPasswordHash = json['user_password_hash'];
    sId = json['s_id'];
    code = json['code'];
    usertype = json['usertype'];
    defaultAddress = json['default_address'] != null
        ? new DefaultAddress.fromJson(json['default_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['user_email'] = userEmail;
    data['mobile'] = mobile;
    data['user_registration_datetime'] = userRegistrationDatetime;
    data['default_address_id'] = defaultAddressId;
    data['user_password_hash'] = userPasswordHash;
    data['s_id'] = sId;
    data['code'] = code;
    data['usertype'] = usertype;
    if (defaultAddress != null) {
      data['default_address'] = defaultAddress!.toJson();
    }
    return data;
  }
}

class DefaultAddress {
  var id;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  var governorateId;
  var regionId;
  var governorateName;
  var regionName;
  var districtName;
  var districtId;

  DefaultAddress(
      {this.id,
        this.streetAddress,
        this.specialMarque,
        this.buildingNumber,
        this.roleNumber,
        this.governorateId,
        this.regionId,
        this.governorateName,
        this.regionName,
        this.districtName,
        this.districtId});

  DefaultAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streetAddress = json['street_address'];
    specialMarque = json['special_marque'];
    buildingNumber = json['building_number'];
    roleNumber = json['role_number'];
    governorateId = json['governorate_id'];
    regionId = json['region_id'];
    governorateName = json['governorate_name'];
    regionName = json['region_name'];
    districtName = json['district_name'];
    districtId = json['district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['street_address'] = streetAddress;
    data['special_marque'] = specialMarque;
    data['building_number'] = buildingNumber;
    data['role_number'] = roleNumber;
    data['governorate_id'] = governorateId;
    data['region_id'] = regionId;
    data['governorate_name'] = governorateName;
    data['region_name'] = regionName;
    data['district_name'] = districtName;
    data['district_id'] = districtId;
    return data;
  }
}
