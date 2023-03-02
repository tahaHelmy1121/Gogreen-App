import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/cart/cartshow.dart';
import 'package:project/presntionlayer/view/profile/profile.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../../datalayer/model/drawermodel.dart';
import '../../presntionlayer/view/about/about.dart';
import '../../presntionlayer/view/address/showaddress/showaddress.dart';
import '../../presntionlayer/view/auth/login.dart';
import '../../presntionlayer/view/delegete/delegatereport.dart';
import '../../presntionlayer/view/delegete/delegateview.dart';
import '../../presntionlayer/view/delegete/ordermanageraccepted.dart';
import '../../presntionlayer/view/home/home.dart';
import '../../presntionlayer/view/order/order.dart';



class DrawerProvider extends ChangeNotifier {
  BuildContext context;
  DrawerProvider({required this.context}) {
    drewDrawerMethod(context: context);
  }

  List<DrawerModel>? _drawerModel = [];

  List<DrawerModel>? get drawerViewModel => _drawerModel;
  SharedPreferences? _sharedPreferences;


  SharedPreferences ?get sharedPreferences => _sharedPreferences;


  var _check;

  get check => _check;
  bool? _customerHear =false ;

  bool? get customerHear => _customerHear;

  set customerHear(bool? value) {
    _customerHear = value;
  }
  String? _name ="";


  String? get name => _name;


  set name(String? value) {
    _name = value;
  }

  drewDrawerMethod({BuildContext? context}) async {
    SharedPreferences? _sharedPreferences =
    await SharedPreferences.getInstance();
    if (_sharedPreferences.getInt("customerType") == null ||
        _sharedPreferences.getInt("customerType") == 0) {
      _drawerModel = [
        DrawerModel(
          title: "الرئيسية",
          navigator: () => HomePage(),
          myIcon: EvaIcons.homeOutline,
        ),
        DrawerModel(
          title: "ماذا عنا ",
          navigator: () => const AboutView(),
          myIcon: Icons.info,
        ),

        DrawerModel(
          title: "تسجيل الدخول",
          navigator: () => const Login(),
          myIcon: EvaIcons.logIn,
        ),
      ];
      notifyListeners();
    } else if (_sharedPreferences.getInt("customerType") == 1){
      _name = _sharedPreferences.getString("name");
      _customerHear=true;
      _drawerModel = [
        DrawerModel(
          title: "الرئيسية",
          navigator: () =>const HomePage(),
          myIcon: EvaIcons.homeOutline,
        ),
        DrawerModel(
          title: "طلباتي",
          navigator: () =>const Order(),
          myIcon: EvaIcons.list,
        ),
        DrawerModel(
          title: "العناوين",
          navigator: () => const ShowAddressView(),
          myIcon: Icons.maps_home_work_outlined,
        ),
        DrawerModel(
          title: "سلة الكراكيب",
          navigator: () => const Cart(),
          myIcon: EvaIcons.shoppingCartOutline,
        ),
        DrawerModel(
          title: "حسابي",
          navigator: () => const ProfilePage(),
          myIcon: Icons.privacy_tip_outlined,
        ),
        DrawerModel(
          title: "ماذا عنا ",
          navigator: () => const AboutView(),
          myIcon: Icons.info,
        ),

        DrawerModel(
          context: context,
          title: "تسجيل الخروج",

          myIcon: EvaIcons.logIn,
        ),
      ];
      notifyListeners();

    } else {
      _name = _sharedPreferences.getString("name");
      _customerHear=true;
      _drawerModel = [
        DrawerModel(
          title: "الرئيسية",
          navigator: () => const DelegateView(),
          myIcon: EvaIcons.homeOutline,
        ),
        DrawerModel(
          title: "طلبات تم تسليمها ",
          navigator: () =>  AAcceptedManagerOrder(),
          myIcon: EvaIcons.list,
        ),
        DrawerModel(
          title: "تقرير للمندوب",
          navigator: () =>const  ReportDelegate(),
          myIcon: EvaIcons.activityOutline,
        ),
        DrawerModel(
          title: "ماذا عنا ",
          navigator: () => const AboutView(),
          myIcon: Icons.info,
        ),
        DrawerModel(
          context: context,
          title: "تسجيل الخروج",

          myIcon: EvaIcons.logIn,
        ),
      ];
      notifyListeners();
    }
  }
}
