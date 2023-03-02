// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

import 'dart:convert';

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));


class CartModel {
  CartModel({
    this.products,
    this.totalCart,
    this.totalPoints,
    this.totalQuantity,
    this.minimumpoints,
  });

  List<ProductCart>? products;
  var totalCart;
  var totalPoints;
  var totalQuantity;
  var minimumpoints;

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
    products: json["products"] == null ? null : List<ProductCart>.from(json["products"].map((x) => ProductCart.fromMap(x))),
    totalCart: json["total_cart"],
    totalPoints: json["total_points"],
    totalQuantity: json["total_quantity"],
    minimumpoints: json["minimumpoints"],
  );

}

class ProductCart {
  ProductCart({
    this.cartId,
    this.customerId,
    this.productId,
    this.productName,
    this.categoryName,
    this.productImage,
    this.quantity,
    this.points,
    this.pointTotal,
    this.price,
    this.total,
  });

  var cartId;
  var customerId;
  var productId;
  var productName;
  var categoryName;
  var productImage;
  var quantity;
  var points;
  var pointTotal;
  var price;
  var total;

  factory ProductCart.fromMap(Map<String, dynamic> json) => ProductCart(
    cartId: json["cart_id"],
    customerId: json["customer_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    categoryName: json["category_name"],
    productImage: json["product_image"],
    quantity: json["quantity"],
    points: json["points"],
    pointTotal: json["point_total"],
    price: json["price"],
    total: json["total"],
  );


}
