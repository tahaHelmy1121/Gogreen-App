// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromMap(jsonString);

import 'dart:convert';

OrdersDetailModel ordersModelDetailsFromMap(String str) => OrdersDetailModel.fromMap(json.decode(str));

List<OrdersModel> ordersModelFromMap(String str) => List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromMap(x)));


class OrdersModel {
  OrdersModel({
    this.id,
    this.customerId,
    this.addressId,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.governoratename,
    this.regionname,
    this.districtname,
    this.orderTotal,
    this.shippingCost,
    this.fullTotal,
    this.orderPoint,
    this.payType,
    this.createDateTime,
    this.orderStatus,
    this.orderStatustext,
    this.taxValue,
    this.orderstatusDate,
    this.tackorderDate,
  });

  var id;
  var customerId;
  var addressId;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  var governoratename;
  var regionname;
  var districtname;
  var orderTotal;
  var shippingCost;
  var fullTotal;
  var orderPoint;
  var payType;
  DateTime? createDateTime;
  var orderStatus;
  var orderStatustext;
  var taxValue;
  var orderstatusDate;
  var tackorderDate;

  factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
    id: json["id"] == null ? null : json["id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    addressId: json["address_id"] == null ? null : json["address_id"],
    streetAddress: json["street_address"] == null ? null : json["street_address"],
    specialMarque: json["special_marque"] == null ? null : json["special_marque"],
    buildingNumber: json["building_number"] == null ? null : json["building_number"],
    roleNumber: json["role_number"] == null ? null : json["role_number"],
    governoratename: json["governoratename"] == null ? null : json["governoratename"],
    regionname: json["regionname"] == null ? null : json["regionname"],
    districtname: json["districtname"] == null ? null : json["districtname"],
    orderTotal: json["order_total"] == null ? null : json["order_total"],
    shippingCost: json["shipping_cost"] == null ? null : json["shipping_cost"],
    fullTotal: json["full_total"] == null ? null : json["full_total"],
    orderPoint: json["order_point"] == null ? null : json["order_point"],
    payType: json["pay_type"] == null ? null : json["pay_type"],
    createDateTime: json["create_date_time"] == null ? null : DateTime.parse(json["create_date_time"]),
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    orderStatustext: json["order_statustext"] == null ? null : json["order_statustext"],
    taxValue: json["tax_value"] == null ? null : json["tax_value"],
    orderstatusDate: json["orderstatus_date"] == null ? null : DateTime.parse(json["orderstatus_date"]),
    tackorderDate: json["tackorder_date"],
  );


}


class OrdersDetailModel {
  OrdersDetailModel({
    this.id,
    this.customerId,
    this.addressId,
    this.streetAddress,
    this.specialMarque,
    this.buildingNumber,
    this.roleNumber,
    this.governoratename,
    this.regionname,
    this.districtname,
    this.orderTotal,
    this.orderPoint,
    this.shippingCost,
    this.fullTotal,
    this.payType,
    this.createDateTime,
    this.orderStatus,
    this.orderStatustext,
    this.taxValue,
    this.orderstatusDate,
    this.tackorderDate,
    this.products,
  });

  var id;
  var customerId;
  var addressId;
  var streetAddress;
  var specialMarque;
  var buildingNumber;
  var roleNumber;
  dynamic governoratename;
  dynamic regionname;
  var districtname;
  var orderTotal;
  var orderPoint;
  var shippingCost;
  var fullTotal;
  var payType;
  DateTime? createDateTime;
  var orderStatus;
  var orderStatustext;
  var taxValue;
  var orderstatusDate;
  var tackorderDate;
  List<ProductOrder>? products;

  factory OrdersDetailModel.fromMap(Map<String, dynamic> json) => OrdersDetailModel(
    id: json["id"] == null ? null : json["id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    addressId: json["address_id"],
    streetAddress: json["street_address"],
    specialMarque: json["special_marque"],
    buildingNumber: json["building_number"],
    roleNumber: json["role_number"],
    governoratename: json["governoratename"],
    regionname: json["regionname"],
    districtname: json["districtname"],
    orderTotal: json["order_total"] == null ? null : json["order_total"],
    orderPoint: json["order_point"] == null ? null : json["order_point"],
    shippingCost: json["shipping_cost"] == null ? null : json["shipping_cost"],
    fullTotal: json["full_total"] == null ? null : json["full_total"],
    payType: json["pay_type"] == null ? null : json["pay_type"],
    createDateTime: json["create_date_time"] == null ? null : DateTime.parse(json["create_date_time"]),
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    orderStatustext: json["order_statustext"] == null ? null : json["order_statustext"],
    taxValue: json["tax_value"] == null ? null : json["tax_value"],
    orderstatusDate: json["orderstatus_date"],
    tackorderDate: json["tackorder_date"],
    products: json["products"] == null ? null : List<ProductOrder>.from(json["products"].map((x) => ProductOrder.fromMap(x))),
  );

}

class ProductOrder {
  ProductOrder({
    this.id,
    this.orderId,
    this.productId,
    this.productName,
    this.productImage,
    this.price,
    this.discountPrice,
    this.quantity,
    this.shippingCost,
    this.total,
    this.points,
    this.totalPoint,
  });

  var id;
  var orderId;
  var productId;
  var productName;
  var productImage;
  var price;
  var discountPrice;
  var quantity;
  var shippingCost;
  var total;
  var points;
  var totalPoint;

  factory ProductOrder.fromMap(Map<String, dynamic> json) => ProductOrder(
    id: json["id"] == null ? null : json["id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productImage: json["product_image"] == null ? null : json["product_image"],
    price: json["price"] == null ? null : json["price"],
    discountPrice: json["discount_price"] == null ? null : json["discount_price"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    shippingCost: json["shipping_cost"] == null ? null : json["shipping_cost"],
    total: json["total"] == null ? null : json["total"],
    points: json["points"] == null ? null : json["points"],
    totalPoint: json["total_point"] == null ? null : json["total_point"],
  );


}
