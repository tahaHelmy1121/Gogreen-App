
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customwidget/constient/massage.dart';
import '../../datalayer/model/auth/registermodel.dart';
import '../../datalayer/model/auth/wevmodel/webmodel.dart';
import '../../datalayer/repostory/auth/policeandprivcewebview/repo/webviewrepo.dart';
import '../../datalayer/repostory/auth/registerrepo.dart';
import '../../presntionlayer/view/home/home.dart';
class RegisterProvider extends ChangeNotifier{
  late final Locator reader;

  RegisterProvider(this.reader);
  SharedPreferences? _sharedPreferences;
  WebModel? _webData;
  bool _isChecked = false;

  bool get isChecked => _isChecked;


  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  WebModel? get webData => _webData;
  getSetting() async {
    _webData = (await WebViewRepo.getUrl())!;
    notifyListeners();
  }
  SharedPreferences? get sharedPreferences => _sharedPreferences;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
           TextEditingController _firstNameEditingController = TextEditingController();
           TextEditingController _lastNameEditingController = TextEditingController();
           TextEditingController _userEditingController = TextEditingController();
           TextEditingController _emailEditingController = TextEditingController();
           TextEditingController _phoneEditingController = TextEditingController();
           TextEditingController _passEditingController = TextEditingController();

  TextEditingController get firstNameEditingController =>
      _firstNameEditingController;

  TextEditingController get lastNameEditingController =>
      _lastNameEditingController;

  TextEditingController get userEditingController => _userEditingController;

  TextEditingController get emailEditingController => _emailEditingController;

  TextEditingController get phoneEditingController => _phoneEditingController;

  TextEditingController get passEditingController => _passEditingController;
  @override
  void dispose() {
    _firstNameEditingController.dispose();
    _lastNameEditingController.dispose();
    _userEditingController.dispose();
    _emailEditingController.dispose();
    _phoneEditingController.dispose();
    _passEditingController.dispose();
    super.dispose();
  }
  set passEditingController(TextEditingController value) {
    _passEditingController = value;
  }

  set phoneEditingController(TextEditingController value) {
    _phoneEditingController = value;
  }

  set emailEditingController(TextEditingController value) {
    _emailEditingController = value;
  }

  set userEditingController(TextEditingController value) {
    _userEditingController = value;
  }

  set lastNameEditingController(TextEditingController value) {
    _lastNameEditingController = value;
  }

  set firstNameEditingController(TextEditingController value) {
    _firstNameEditingController = value;

  }

  setCustomerId(int index) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setInt('customerId', index);
  }
  regstier(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      String firstName = firstNameEditingController.text;
      String lastName = lastNameEditingController.text;
      String userName = userEditingController.text;
      String emailAddress = emailEditingController.text;
      String phone = phoneEditingController.text;
      String password = passEditingController.text;
      List data = await RegisterRepository.getRegisterRepo(
        name: firstName,
        email: emailAddress,
        mobile: phone,
        password: password,
        deviceId: "x",
      );
      if (data[0].customerId != null) {
        setCustomerId(data[0].customerId!);
      }
      if (data[0].status == 1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              data[0].reason!,
              style: TextStyle(fontFamily: "BigVesta"),
            ),
            duration: Duration(milliseconds: 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            elevation: 10,
            onVisible: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), (route) => false);
            },
          ));
      } else {
       MassageApp.flusherBarErrorMassage(context, data[0].reason, "", (flushbar) {

       });
      }
    } else {
      return  MassageApp.toastMassage("حدث اخطاء");
    }
  }
}