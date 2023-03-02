import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:project/datalayer/model/delegete/orderavalable.dart';
import 'package:project/datalayer/repostory/delegete/orderderavailablerepo.dart';
import 'package:project/datalayer/repostory/delegete/tackorder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../customwidget/style.dart';
import '../../datalayer/model/delegete/tackorder.dart';


class OrderAvailableprovider extends ChangeNotifier {
  OrderAvailableprovider() {
    showOrderAvFromRepo();
  }

  List<OrderAvailableModel>? _data;

  List<OrderAvailableModel>? get data => _data;

  set data(List<OrderAvailableModel>? value) {
    _data = value;
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

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  showOrderAvFromRepo() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _delegate = (_sharedPreferences!.getInt("delId"))!;
    _data =
        await OrderAvailableRepoX.getOrderAvailableRepo(delegateId: _delegate);
    _loading = true;
    notifyListeners();
  }
  Timer? _timer ;
  relodTable(BuildContext context) {
    _timer= Timer(const Duration(seconds: 15), ()=>  showOrderAvFromRepo());
  }

  TackOrder? _tackOrder;

  TackOrder? get tackOrder => _tackOrder;

  set tackOrder(TackOrder? value) {
    _tackOrder = value;
  }

  tackOrderFromRepo({var index, context}) async {
    _tackOrder = await TackOrderRepo.tackOrderRepo(
        delegateId: _delegate, orderId: index);

    if (_tackOrder!.status == 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            _tackOrder!.reason.toString(),
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
      showOrderAvFromRepo();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            _tackOrder!.reason.toString(),
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
      showOrderAvFromRepo();
      notifyListeners();
    }
  }

  showOrderDetails({var index, context}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AwesomeDialog(
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "بيانات الطلب",
                    style: CustomTitleStyle.customTitleStyle(
                        color: Colors.teal, size: 17),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].customerName.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :اسم العميل",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].customerMobile.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم الهاتف",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].regionName.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :المنطقه",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].districtname.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :الحي",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].streetAddress.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :عنوان الشارع",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].specialMarque.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :علامه مميزة",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].buildingNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم العماره",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .04, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].roleNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم الدور",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.red.shade900, size: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * .10, bottom: 4, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          _data![index].fullTotal.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :الإجمالي",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.teal, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _data![index].longitude==null|| _data![index].longitude==null
              ? SizedBox(height: height*.01,)
              : InkWell(
                  onTap: ()async {
                    final availableMaps = await MapLauncher.installedMaps;
                    await availableMaps.first.showMarker(
                      coords: Coords(double.parse(_data![index].latitude),double.parse(_data![index].longitude)),
                      title: "عنوان الطلب ",

                    );

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: height * .05,
                      width: width * .70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icons8-map-64.png",fit: BoxFit.cover,),
                          Text(
                            "عرض العنوان علي الخريطه",
                            style: CustomTitleStyle.customTitleStyle(size: 13,color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
      context: context,
      dialogType: DialogType.INFO_REVERSED,
      animType: AnimType.TOPSLIDE,
      closeIcon: const Icon(Icons.clear, color: Colors.black87),
      showCloseIcon: true,
    )..show();
    notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }
}
