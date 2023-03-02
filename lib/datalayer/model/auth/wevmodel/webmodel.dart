

import 'dart:convert';

WebModel webModelFromMap(String str) => WebModel.fromMap(json.decode(str));


class WebModel {
  WebModel({

    this.minimumpoints,
    this.policyLink,
    this.introduction,
    this.introduction1,
    this.conditions,
    this.conditions1,
    this.okay,
  });


  var minimumpoints;
  var policyLink;
  var introduction;
  var introduction1;
  var conditions;
  var conditions1;
  var okay;

  factory WebModel.fromMap(Map<String, dynamic> json) => WebModel(
    minimumpoints: json["minimumpoints"],
    policyLink: json["policy_link"],
    introduction: json["introduction"],
    introduction1: json["introduction1"],
    conditions: json["conditions"],
    conditions1: json["conditions1"],
    okay: json["okay"],
  );

}
