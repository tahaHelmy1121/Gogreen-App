import 'dart:convert';

ProductsModel productsFromMap(String str) => ProductsModel.fromMap(json.decode(str));


class ProductsModel {
  ProductsModel({
    this.products,
    this.minimumpoints,
    this.totalCart,
    this.totalPoints,
    this.totalQuantity,
    this.countproducts,
  });

  List<Product>? products;
  var minimumpoints;
  var totalCart;
  var totalPoints;
  var totalQuantity;
  var countproducts ;

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    minimumpoints: json["minimumpoints"] == null ? null : json["minimumpoints"],
    totalCart: json["total_cart"] == null ? null : json["total_cart"],
    totalPoints: json["total_points"] == null ? null : json["total_points"],
    totalQuantity: json["total_quantity"] == null ? null : json["total_quantity"],
    countproducts: json["count_products"] == null ? null : json["count_products"],
  );

}

class Product {
  Product({
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

  factory Product.fromMap(Map<String, dynamic> json) => Product(
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



