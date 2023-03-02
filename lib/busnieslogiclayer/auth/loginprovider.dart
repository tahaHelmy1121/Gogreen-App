import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customwidget/constient/massage.dart';
import '../../datalayer/model/auth/loginmodel.dart';
import '../../datalayer/repostory/auth/loginrepo.dart';
import '../../presntionlayer/view/delegete/delegateview.dart';
import '../../presntionlayer/view/home/home.dart';
import '../cart/cartprovider.dart';

class LoginProvider extends ChangeNotifier {
  late final Locator reader;
  late final Locator cartReader;

  LoginProvider(this.reader, this.cartReader);

  LoginModel? _loginModel = LoginModel();

  LoginModel? get loginModel => _loginModel;
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _passwrordEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();

  set userEditingController(TextEditingController value) {
    _passwrordEditingController = value;
  }

  TextEditingController get passwrordEditingController =>
      _passwrordEditingController;

  @override
  void dispose() {
    _passwrordEditingController.dispose();
    _phoneEditingController.dispose();
    super.dispose();
  }

  TextEditingController get phoneEditingController => _phoneEditingController;

  set phoneEditingController(TextEditingController value) {
    _phoneEditingController = value;
  }

  setCustomerId(int index) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setInt('customerId', index);
  }

  getLoginFromRepo(
      {var userName, password, deviceId, required  context}) async {
    List<LoginModel> _loginModel =
        (await LoginRepository.getLogin(userName, password, deviceId));
    if (_loginModel[0].status == 1) {
      if (_loginModel[0].usertype == 1) {
        _sharedPreferences = await SharedPreferences.getInstance();
        _sharedPreferences!
            .setInt("customerId", _loginModel[0].userId!.toInt());
        _sharedPreferences!
            .setInt("customerType", _loginModel[0].usertype!.toInt());
        _sharedPreferences!
            .setString("name", _loginModel[0].profile!.firstName.toString());
        // reader<DrawerViewModel>().drewDrawerMethod(context: null);
        cartReader<CartProvider>().getCart(context);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text(
                _loginModel[0].reason.toString(),
                style: const TextStyle(fontFamily: "Almarai"),
              ),
              duration: const Duration(milliseconds: 35),
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
                    child: (_loginModel[0].usertype == 1)
                        ? HomePage()
                        : const DelegateView(), //TODO delgete admin
                  );
                }), (route) => false);
              }));
        notifyListeners();
      } else {
        _sharedPreferences = await SharedPreferences.getInstance();
        _sharedPreferences!.setInt("delId", _loginModel[0].userId!.toInt());
        _sharedPreferences!
            .setInt("customerType", _loginModel[0].usertype!.toInt());
        _sharedPreferences!
            .setString("name", _loginModel[0].profile!.firstName.toString());
        //  reader<DrawerViewModel>().drewDrawerMethod(context: null);
        cartReader<CartProvider>().getCart(context);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text(
                _loginModel[0].reason.toString(),
                style: const TextStyle(fontFamily: "Almarai"),
              ),
              duration: const Duration(milliseconds: 35),
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
                    child: (_loginModel![0].usertype == 1)
                        ? const HomePage()
                        : const DelegateView(), //TODO delgete
                  );
                }), (route) => false);
              }));
        notifyListeners();
      }
    } else {
      MassageApp.flusherBarErrorMassage(
          context, _loginModel[0].reason, "", (flushbar) {});
      notifyListeners();
    }
  }
}
