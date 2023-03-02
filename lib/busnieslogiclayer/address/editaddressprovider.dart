import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker_flutter/google_map_location_picker_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/datalayer/repostory/address/editAddress/addaddressrepo.dart';
import 'package:project/datalayer/repostory/address/editAddress/regionrepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customwidget/constient/massage.dart';
import '../../customwidget/resultproces/resultproces.dart';
import '../../datalayer/model/address/addressupdate.dart';
import '../../datalayer/model/address/editaddress/districts.dart';
import '../../datalayer/model/address/editaddress/goverorates.dart';
import '../../datalayer/model/address/editaddress/region.dart';
import '../../datalayer/repostory/address/addressupdate.dart';
import '../../datalayer/repostory/address/editAddress/GovernoratesRepo.dart';
import '../../datalayer/repostory/address/editAddress/districtsRepo.dart';
import '../../presntionlayer/view/address/showaddress/showaddress.dart';

class EditAddressProvider extends ChangeNotifier {
  BuildContext? context;

  var govXd, regionXd, disXd, latituade, longtuade;

  EditAddressProvider(
      {this.govXd, this.regionXd, this.disXd, this.latituade, this.longtuade}) {
    getGovFromRepo(gov: govXd, reg: regionXd, dis: disXd);
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  List<Governorates>? _myGov = [];

  List<Governorates>? get myGov => _myGov;
  var _govSelected = 0;

  get govSelected => _govSelected;

  set govSelected(value) {
    _govSelected = value;
    notifyListeners();
  }

  bool govLoading = false;
  List<Region>? _regionData;

  List<Region>? get regionData => _regionData;

  set regionData(List<Region>? value) {
    _regionData = value;
    notifyListeners();
  }

  List<Districts>? _dissData;

  List<Districts>? get dissData => _dissData;
  bool disLoad = false;
  var _disSelect = 0;

  get disSelect => _disSelect;

  set disSelect(value) {
    _disSelect = value;
    notifyListeners();
  }

  var _govId = 0;

  get govId => _govId;

  set govId(value) {
    _govId = value;
    notifyListeners();
  }

  getGovFromRepo({var gov, reg, dis}) async {
    _myGov = await GovRepo.getGov(governorate: gov);
    govLoading = true;
    _govSelected = _myGov![0].id;
    getRegionFromRepo(xId: _govSelected, regionId: reg, dis: dis);
    notifyListeners();
  }

  var _regionSelect = 0;

  get regionSelect => _regionSelect;

  set regionSelect(value) {
    _regionSelect = value;
    notifyListeners();
  }

  bool regionLoad = false;

  getRegionFromRepo({var xId, regionId, dis}) async {
    _regionData = await RegionRepo.getRegion(governId: xId, regions: regionId);
    regionLoad = true;
    _regionSelect = _regionData!.first.id!;
    getDisFromRepo(x: _regionSelect, id: dis);

    notifyListeners();
  }

  getDisFromRepo({var x, id}) async {
    _dissData = await DistrictsRepo.getDis(regionId: x, dis: id);
    disLoad = true;
    _disSelect = _dissData!.first.id!;
    notifyListeners();
  }

  set position(Position? value) {
    _position = value;
    notifyListeners();
  }

  Position? _position;

  Position? get position => _position;

  bool? _positionLoading = false;

  bool? get positionLoading => _positionLoading;
  AddressResult? _result;

  AddressResult? get result => _result;

  set result(AddressResult? value) {
    _result = value;
  }

  Future getLocation(context) async {
    LocationPermission? locationPermission;

    var _location = await Geolocator.isLocationServiceEnabled();
    if (_location == false) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          desc: "انت غير مفعل الوصول الى موقعك",
          btnOkColor: Colors.blue,
          btnOkOnPress: () {
            Geolocator.openLocationSettings();
          }).show();
      notifyListeners();
      {}
    } else {
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        _position = await Geolocator.getCurrentPosition();
        if (latituade == 0 || longtuade == 0) {
          _result = await showGoogleMapLocationPicker(
              pinWidget: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 55,
              ),
              pinColor: Colors.blue,
              context: context,
              addressPlaceHolder: "حرك الخريطة",
              addressTitle: "عنوان التوصيل",
              apiKey: "AIzaSyAq-75h9Neayo0iVq0IuCDW9zwIGTEgAWo",
              appBarTitle: "حدد موقع التوصيل",
              confirmButtonColor: Colors.green,
              confirmButtonText: "تأكيد الموقع",
              confirmButtonTextColor: Colors.white,
              country: "eg",
              language: "ar",
              searchHint: "ابحث عن موقع",
              initialLocation:
                  LatLng(_position!.latitude, _position!.longitude));
        } else {
          _result = await showGoogleMapLocationPicker(
              pinWidget: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 55,
              ),
              pinColor: Colors.blue,
              context: context,
              addressPlaceHolder: "حرك الخريطة",
              addressTitle: "عنوان التوصيل",
              apiKey: "AIzaSyAq-75h9Neayo0iVq0IuCDW9zwIGTEgAWo",
              appBarTitle: "حدد موقع التوصيل",
              confirmButtonColor: Colors.green,
              confirmButtonText: "تأكيد الموقع",
              confirmButtonTextColor: Colors.white,
              country: "eg",
              language: "ar",
              searchHint: "ابحث عن موقع",
              initialLocation: LatLng(latituade, longtuade));
        }

        _positionLoading = true;
        notifyListeners();
      }
    }
  }

  UpdateAddress? _addressUpdate;

  SharedPreferences? _sharedPreferences;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  set sharedPreferences(SharedPreferences? value) {
    _sharedPreferences = value;
  }

  UpdateAddress? get addressUpdate => _addressUpdate;

  set addressUpdate(UpdateAddress? value) {
    _addressUpdate = value;
  }

  var customer = 0;

  updateAddressFromRepo(
      {var id,
      regionId,
      governorateId,
      districtId,
      name,
      specialMarque,
      buildingNumber,
      roleNumber,
      context}) async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences? shared = await SharedPreferences.getInstance();
      customer = shared.getInt("customerId")!;
      _addressUpdate = await UpAddressRepo.responseUpdate(
          id: id,
          regionId: regionId,
          customerId: customer,
          latitude: _result == null ? null : _result!.latlng.latitude,
          longitude: _result == null ? null : _result!.latlng.longitude,
          isDefault: _isChecked == true ? 1 : 0,
          streetAddress: name,
          specialMarque: specialMarque,
          governorateId: governorateId,
          districtId: districtId,
          roleNumber: roleNumber,
          buildingNumber: buildingNumber);
      if (_addressUpdate!.status == 1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text(
                _addressUpdate!.reason.toString(),
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
              onVisible: () {
                Navigator.pushAndRemoveUntil(context,
                    PageRouteBuilder(pageBuilder: (context, animation, widget) {
                  return FadeTransition(
                      opacity: animation, child: const ShowAddressView());
                }), (route) => false);
              }));
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              _addressUpdate!.reason.toString(),
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
      }
    }
  }
}
