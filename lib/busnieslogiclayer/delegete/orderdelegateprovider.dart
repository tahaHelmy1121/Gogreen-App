import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:project/datalayer/model/delegete/orderdelegate.dart';
import 'package:project/datalayer/repostory/delegete/delegateorder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../datalayer/model/delegete/orderstatus.dart';
import '../../datalayer/repostory/delegete/orderstatusrepo.dart';

class OrderDelegateProvider extends ChangeNotifier {
var stateOrder ;
OrderDelegateProvider({this.stateOrder}){

  getMyOrderFromRepo(status: stateOrder);
}
  List<DelegateOrder>? _myOrder;

  List<DelegateOrder>? get myOrder => _myOrder;

  set myOrder(List<DelegateOrder>? value) {
    _myOrder = value;
  }
  bool _myOrderLoading =false;
  bool get myOrderLoading => _myOrderLoading;

  set myOrderLoading(bool value) {
    _myOrderLoading = value;
  }
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  set sharedPreferences(SharedPreferences? value) {
    _sharedPreferences = value;
  }

  var _delegate = 0;

  get delegate => _delegate;

  set delegate(value) {
    _delegate = value;
  }
  getMyOrderFromRepo({var status})async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _delegate = (_sharedPreferences!.getInt("delId"))!;
    _myOrder=await DelegateOrderRepo.getMyOrder(delegateId:_delegate,orderStatus: status);
    _myOrderLoading=true;
    notifyListeners();
  }
DelegateOrderStatus? _delegateOrderStatus;

DelegateOrderStatus? get delegateOrderStatus => _delegateOrderStatus;


set delegateOrderStatus(DelegateOrderStatus? value) {
  _delegateOrderStatus = value;
}

orderStateFromRepo({var orderId,orderStatus,reasonRefuse,context})async{
  _delegateOrderStatus =await OrderStateRepo.orderStatus(orderId: orderId,orderStatus:orderStatus,reasonRefuse:reasonRefuse);
  if (_delegateOrderStatus!.status == 1) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          _delegateOrderStatus!.reason.toString(),
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        elevation: 10,
      ));
    getMyOrderFromRepo();
    notifyListeners();
  } else {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          _delegateOrderStatus!.reason.toString(),
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        elevation: 10,
      ));

    notifyListeners();
  }

  notifyListeners();
}
showLocation({var index})async{
  final availableMaps = await MapLauncher.installedMaps;
  await availableMaps.first.showMarker(
    coords: Coords(double.parse(_myOrder![index].latitude),double.parse(_myOrder![index].longitude)),
    title: "عنوان الطلب ",

  );
  notifyListeners();
}

}