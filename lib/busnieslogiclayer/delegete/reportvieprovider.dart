import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:project/datalayer/model/delegete/orderdelegate.dart';
import 'package:project/datalayer/repostory/delegete/delegateorder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../customwidget/style.dart';
class ReportDelegatepovide extends ChangeNotifier {
  ReportDelegatepovide() {
    getMyOrderFromRepo();
  }

  List<DelegateOrder>? _myOrder;

  List<DelegateOrder>? get myOrder => _myOrder;

  set myOrder(List<DelegateOrder>? value) {
    _myOrder = value;
  }

  bool _myOrderLoading = false;

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

  DateTime _dateFrom =DateTime.now();

var _from ;

  get from => _from;


  set from(value) {
    _from = value;
  }
  var _to ;

  get to => _to;


  set to(value) {
    _to = value;
  }

  DateTime get dateFrom => _dateFrom;

  set dateFrom(DateTime value) {
    _dateFrom = value;
  }

  var _dateTo ;

  get dateTo => _dateTo;


  set dateTo(value) {
    _dateTo = value;
  }

  Future<void> selectDate({required BuildContext context, var caseDate}) async {
    DateTime? picked =DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day) ;
      picked = await showDatePicker(
        confirmText: "تاكيد",
        cancelText: "إلغاء",
        helpText: caseDate == 1 ? "اختار من تاريخ " : "اختار إلي تاريخ ",
        context: context,
        initialDate: _dateFrom,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (caseDate == 1) {
      if (picked != null && picked != _dateFrom) {
        var formatter =  DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(picked);
        _from=formattedDate;

      }
    } else {
      if (picked != null && picked != _dateFrom) {
        var formatter =  DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(picked);
        _to=formattedDate;
      }
    }

    notifyListeners();
  }
search()async{
  _sharedPreferences = await SharedPreferences.getInstance();
  _delegate = (_sharedPreferences!.getInt("delId"))!;
  _myOrder = await DelegateOrderRepo.getMyOrder(
      delegateId: _delegate, orderStatus: 'all',start: _from,end: _to);
  _myOrderLoading = true;
  _from=null;
  _to=null;
  notifyListeners();

}


  getMyOrderFromRepo() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _delegate = (_sharedPreferences!.getInt("delId"))!;
    _myOrder = await DelegateOrderRepo.getMyOrder(
        delegateId: _delegate, orderStatus: 'all');
    _myOrderLoading = true;
    notifyListeners();
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
                          _myOrder![index].name.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :اسم العميل",

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
                          _myOrder![index].phone.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم الهاتف",
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
                          _myOrder![index].regionname.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :المنطقه",
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
                          _myOrder![index].districtname.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :الحي",
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
                          _myOrder![index].streetAddress.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :عنوان الشارع",
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
                          _myOrder![index].specialMarque.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :علامه مميزة",
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
                          _myOrder![index].buildingNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم العماره",
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
                          _myOrder![index].roleNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :رقم الدور",
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
                          _myOrder![index].fullTotal.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.black, size: 14),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "  :الإجمالي",
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
          _myOrder![index].longitude == 0 || _myOrder![index].longitude == 0
              ? SizedBox()
              : InkWell(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    await availableMaps.first.showMarker(
                      coords: Coords(double.parse(_myOrder![index].latitude),
                          double.parse(_myOrder![index].longitude)),
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
                          Image.asset(
                            "assets/image/icons8-map-64.png",
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "عرض العنوان علي الخريطه",
                            style: CustomTitleStyle.customTitleStyle(
                                size: 13, color: Colors.red),
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
  }
}
