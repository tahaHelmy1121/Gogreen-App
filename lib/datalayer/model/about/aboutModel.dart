// To parse this JSON data, do
//
//     final about = aboutFromMap(jsonString);

import 'dart:convert';

List<AboutModel> aboutFromMap(String str) => List<AboutModel>.from(json.decode(str).map((x) => AboutModel.fromMap(x)));


class AboutModel {
  AboutModel({
    this.id,
    this.isBottom,
    this.sortOrder,
    this.status,
    this.name,
    this.describe,
    this.metaTitle,
    this.metaTagsDescribe,
    this.metaTagsKeywords,
    this.image,
  });

  var id;
  var isBottom;
  var sortOrder;
  var status;
  var name;
  var describe;
  var metaTitle;
  var metaTagsDescribe;
  var metaTagsKeywords;
  var image;

  factory AboutModel.fromMap(Map<String, dynamic> json) => AboutModel(
    id: json["id"] == null ? null : json["id"],
    isBottom: json["is_bottom"] == null ? null : json["is_bottom"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
    describe: json["describe"] == null ? null : json["describe"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaTagsDescribe: json["meta_tags_describe"] == null ? null : json["meta_tags_describe"],
    metaTagsKeywords: json["meta_tags_keywords"] == null ? null : json["meta_tags_keywords"],
    image: json["image"] == null ? null : json["image"],
  );

}
