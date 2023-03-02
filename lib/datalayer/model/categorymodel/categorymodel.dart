

import 'dart:convert';
List<CategoryModel> categoryModelRouteFromMap(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromMap(x)));

class CategoryModel {
  CategoryModel({
    this.id,
    this.parentId,
    this.attributeGroups,
    this.filters,
    this.isTop,
    this.isColumn,
    this.sortOrder,
    this.status,
    this.lastAdd,
    this.image,
    this.imageHome,
    this.name,
    this.describe,
    this.metaTitle,
    this.metaTagsDescribe,
    this.metaTagsKeywords,
    this.products,
  });

  var id;
  var parentId;
  var attributeGroups;
  var filters;
  var isTop;
  var isColumn;
  var sortOrder;
  var status;
  var lastAdd;
  var image;
  var imageHome;
  var name;
  var describe;
  var metaTitle;
  var metaTagsDescribe;
  var metaTagsKeywords;
  List<ProductHome>? products;


  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    attributeGroups: json["attribute_groups"],
    filters: json["filters"],
    isTop: json["is_top"] == null ? null : json["is_top"],
    isColumn: json["is_column"] == null ? null : json["is_column"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    status: json["status"] == null ? null : json["status"],
    lastAdd: json["last_add"] == null ? null : json["last_add"],
    image: json["image"] == null ? null : json["image"],
    imageHome: json["image_home"] == null ? null : json["image_home"],
    name: json["name"] == null ? null : json["name"],
    describe: json["describe"] == null ? null : json["describe"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaTagsDescribe: json["meta_tags_describe"] == null ? null : json["meta_tags_describe"],
    metaTagsKeywords: json["meta_tags_keywords"] == null ? null : json["meta_tags_keywords"],
    products: json["products"] == null ? null : List<ProductHome>.from(json["products"].map((x) => ProductHome.fromMap(x))),
  );


}


class ProductHome {
  ProductHome({
    this.id,
    this.price,
    this.cartquantity,
    this.quantity,
    this.minQuantity,
    this.points,
    this.categoryId,
    this.categoryName,
    this.image,
    this.name,
    this.describe,
  });

  var id;
  var price;
  var cartquantity;
  var quantity;
  var minQuantity;
  var points;
  var categoryId;
  var categoryName;
  var image;
  var name;
  var describe;

  factory ProductHome.fromJson(String str) => ProductHome.fromMap(json.decode(str));


  factory ProductHome.fromMap(Map<String, dynamic> json) => ProductHome(
    id: json["id"] == null ? null : json["id"],
    price: json["price"] == null ? null : json["price"],
    cartquantity: json["cartquantity"] == null ? null : json["cartquantity"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    minQuantity: json["min_quantity"] == null ? null : json["min_quantity"],
    points: json["points"] == null ? null : json["points"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    describe: json["describe"] == null ? null : json["describe"],
  );


}





