import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker_flutter/google_map_location_picker_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/busnieslogiclayer/cart/cartprovider.dart';
import 'package:project/presntionlayer/view/address/addressdetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/model/address/Address.dart';
import '../../datalayer/model/address/editaddress/addaddressmodel.dart';
import '../../datalayer/model/address/editaddress/districts.dart';
import '../../datalayer/model/address/editaddress/goverorates.dart';
import '../../datalayer/model/address/editaddress/region.dart';
import '../../datalayer/model/address/removeaddress.dart';
import '../../datalayer/model/order/ordersuremodel.dart';
import '../../datalayer/repostory/address/adressrepo.dart';
import '../../datalayer/repostory/address/editAddress/GovernoratesRepo.dart';
import '../../datalayer/repostory/address/editAddress/addaddressrepo.dart';
import '../../datalayer/repostory/address/editAddress/districtsRepo.dart';
import '../../datalayer/repostory/address/editAddress/regionrepo.dart';
import '../../datalayer/repostory/address/removeaddress.dart';
import '../../datalayer/repostory/order/ordersurerepo.dart';
import '../../presntionlayer/view/address/add/addaddress.dart';
import '../../presntionlayer/view/address/showaddress/showaddress.dart';
import '../../presntionlayer/view/home/home.dart';


class AddressProvider extends ChangeNotifier {
  final Locator reader;

  AddressProvider(this.reader) {
    showAddress();
    getGovFromRepo();
  }

  List<Addresses> _myListAddress = [
    Addresses(id: 0, districtName: "اضف عنوان ", regionName: ""),
  ];

  List<Addresses>? get myListAddress => _myListAddress;
  var _selectednvalue;

  get selectednvalue => _selectednvalue;

  set selectednvalue(value) {
    _selectednvalue = value;
    notifyListeners();
  }

  bool lod = false;
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;
  var customer = 0;


  List<Addresses>? _address = [];

  List<Addresses>? get address => _address;

  set address(List<Addresses>? value) {
    _address = value;
  }

   showAddress() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    customer = _sharedPreferences!.getInt("customerId")!;
    _myListAddress
        .addAll((await AddressRepo.getAddressRepo(customerId: customer))!);
    _address = await AddressRepo.getAddressRepo(customerId: customer);
    if (_myListAddress.length > 1) {
      _selectednvalue = _myListAddress[1].id;
    } else {
      _selectednvalue = _myListAddress[0].id;
    }

    lod = true;
    notifyListeners();
  }
  RemoveAddress? _remove;

  RemoveAddress? get remove => _remove;

  removeAddress({var id, context}) async {
    _remove = await RemoveAddRepo.removeAddressRepo(id: id);
    if (_remove!.status == 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            _remove!.reason.toString(),
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
      showAddress();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Text(
          _remove!.reason.toString(),
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        elevation: 10,
        duration: const Duration(seconds: 1),
      ));
      notifyListeners();
    }
  }


  List<Governorates>? _myGov = [];

  List<Governorates>? get myGov => _myGov;
  var _govSelected = 0;

  get govSelected => _govSelected;

  set govSelected(value) {
    _govSelected = value;
  }

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

  void  getGovFromRepo() async {
    _myGov = await GovRepo.getGov();
    _govSelected = _myGov!.first.id;

    getRegionFromRepo(_govSelected);
    notifyListeners();
  }

  var _regionSelect = 0;

  get regionSelect => _regionSelect;

  set regionSelect(value) {
    _regionSelect = value;
    notifyListeners();
  }

  bool regionLoad = false;

  getRegionFromRepo(var xId) async {
    _regionData = await RegionRepo.getRegion(governId: xId);
    regionLoad = true;
    _regionSelect = _regionData![0].id!;
    getDisFromRepo(_regionSelect);
    notifyListeners();
  }

  getDisFromRepo(var x) async {
    _dissData = await DistrictsRepo.getDis(regionId: x);
    disLoad = true;
    _disSelect = _dissData![0].id!;
    notifyListeners();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  TextEditingController? textEditingControllerTitle = TextEditingController();
  TextEditingController? textEditingControllerPoint = TextEditingController();
  TextEditingController? textEditingControllerHomeNumber =
  TextEditingController();
  TextEditingController? textEditingControllerHomeFloat =
  TextEditingController();



  floatActionAddAddress(context) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: AddAddress(),
          );
        }));
  }

  dropDownChange(context,index) {

    if (index == 0) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              child: AddAddress(),
            );
          },
        ),
      );
      notifyListeners();
    } else {
      _selectednvalue = index;
      notifyListeners();
    }
  }
  Position? _position;

  Position? get position => _position;

  set position(Position? value) {
    _position = value;
    notifyListeners();
  }

  bool? _positionLoading = false;

  bool? get positionLoading => _positionLoading;
  AddressResult? _result ;

  AddressResult? get result => _result;

  set result(AddressResult? value) {
    _result = value;
  }

  Future location( context) async {
    LocationPermission? per;
    var locationServices = await Geolocator.isLocationServiceEnabled();

    if (locationServices == false) {
      AwesomeDialog(

        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        desc: 'انت غير مفعل الوصول الي موقعك',
        btnOkText: "الذهاب للموقع",
        btnOkColor: Colors.red.shade700,
        btnOkOnPress: ()async {
          await  Geolocator.openLocationSettings();
        },
      ).show();
      notifyListeners();
    } else {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
      } else {
        _position = await Geolocator.getCurrentPosition() ;
        if(_position!=null){
          _result=await   showGoogleMapLocationPicker(

              pinWidget: const Icon(Icons.location_pin,color: Colors.red,size: 55,),
              pinColor: Colors.blue,
              context: context,
              addressPlaceHolder: "حرك الخريطة",
              addressTitle: "عنوان التوصيل",
              apiKey: "AIzaSyAq-75h9Neayo0iVq0IuCDW9zwIGTEgAWo",
              appBarTitle: "حدد موقع التوصيل",
              confirmButtonColor: Colors.green,
              confirmButtonText: "تأكيد الموقع",
              confirmButtonTextColor: Colors.white,
              country:"eg",
              language:"ar" ,
              searchHint: "ابحث عن موقع", initialLocation: LatLng(position!.latitude,position!.longitude)
          );


        }
        _positionLoading = true;
      }
      notifyListeners();
    }
  }

  AddAddressModel? addAddressModel;

  addAddress( context,bool?sureScreen) async {
    if (_formKey.currentState!.validate()) {
      String name = textEditingControllerTitle!.text;
      String smart = textEditingControllerPoint!.text;
      String homNumber = textEditingControllerHomeNumber!.text;
      String numberFlot = textEditingControllerHomeFloat!.text;
      addAddressModel = await AddAddressRepo.responseAdd(
        regionId: _regionSelect,
        customerId: customer,
        roleNumber: numberFlot,
        buildingNumber: homNumber,
        districtId: _disSelect,
        governorateId: _govSelected,
        specialMarque: smart,
        streetAddress: name,
        isDefault: _isChecked == true ? 1 : 0,
        lat: _result == null ? null : _result!.latlng.latitude,
        long: _result == null ? null : _result!.latlng.longitude,
      );
      if (addAddressModel!.status == 1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text(
                addAddressModel!.reason.toString(),
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
                if (sureScreen == true) {
                  Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                      pageBuilder: (context, animation, widget) {
                        return FadeTransition(
                            opacity: animation,
                            child: const AddressDetails());
                      }), (route) => false);
                } else {
                  Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                      pageBuilder: (context, animation, widget) {
                        return FadeTransition(
                            opacity: animation, child: ShowAddressView());
                      }), (route) => false);
                }
              }
          ));
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              addAddressModel!.reason.toString(),
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


  OrderSure? _orderSure;

 OrderSure? get orderSure => _orderSure;

  getResponseOrderFromRepo({context}) async {
    _orderSure = await OrderSureRepo.getResponseOrderSure(
        customerId: customer, addressId: _selectednvalue);
    if (_orderSure!.status == 1) {
      reader<CartProvider>().getCart(context);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text(
              _orderSure!.reason.toString(),
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
                      opacity: animation,
                      child: const HomePage(),
                    );
                  }), (route) => false);
            }));
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            _orderSure!.reason.toString(),
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
    notifyListeners();
    /*
                  1 => this is function used in addressDetails and done orderSure

                 */
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingControllerTitle!.dispose();
    textEditingControllerPoint!.dispose();
    textEditingControllerHomeNumber!.dispose();
    textEditingControllerHomeFloat!.dispose();
  }
}
