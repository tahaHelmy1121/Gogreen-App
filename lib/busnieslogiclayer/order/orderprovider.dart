import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../datalayer/model/order/oredrmodel.dart';
import '../../datalayer/repostory/order/ordermodelrepo.dart';

class OrderProvider extends ChangeNotifier {

  OrderProvider() {
    getOrderFromRepo();
  }

  List<OrdersModel>? _orders = [];

  List<OrdersModel>? get orders => _orders;

  set orders(List<OrdersModel>? value) {
    _orders = value;
  }

  bool ? _loading = false;


  bool? get loading => _loading;

  getOrderFromRepo({var id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var customer=   sharedPreferences.getInt("customerId");
    _orders = await OrdersUserRepo.getUserOrders(customerId:customer);
    _loading = true;
    notifyListeners();
  }

}