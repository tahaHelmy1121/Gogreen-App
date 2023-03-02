import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/customwidget/constient/massage.dart';
import 'package:project/datalayer/model/profile/profilemodel.dart';
import 'package:project/presntionlayer/view/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/model/profile/ubdateprofile.dart';
import '../../datalayer/repostory/profile/profilerepo.dart';
import '../../datalayer/repostory/profile/updateprofile.dart';

class ProfileProvider extends ChangeNotifier {
  late final Locator reader;

  ProfileProvider({required this.reader}) {
    getprofile();
  }

  TextEditingController _textEditingControllerName = TextEditingController();

  TextEditingController _textEditingControllerEmail = TextEditingController();

  TextEditingController _textEditingControllerPhone = TextEditingController();

  TextEditingController _textEditingControllerPassword = TextEditingController();
  Profile? _profile = Profile();
  bool? _loading = false;

  TextEditingController get textEditingControllerName =>
      _textEditingControllerName;

  set textEditingControllerName(TextEditingController value) {
    _textEditingControllerName = value;
  }

  TextEditingController get textEditingControllerEmail =>
      _textEditingControllerEmail;

  set textEditingControllerEmail(TextEditingController value) {
    _textEditingControllerEmail = value;
  }

  bool? get loading => _loading;

  set loading(bool? value) {
    _loading = value;
  }

  Profile? get profile => _profile;

  set profile(Profile? value) {
    _profile = value;
  }

  TextEditingController get textEditingControllerPassword =>
      _textEditingControllerPassword;

  set textEditingControllerPassword(TextEditingController value) {
    _textEditingControllerPassword = value;
  }

  TextEditingController get textEditingControllerPhone =>
      _textEditingControllerPhone;

  set textEditingControllerPhone(TextEditingController value) {
    _textEditingControllerPhone = value;
  }

  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;
  var user;
  UpdateProfile? _updateProfile = UpdateProfile();

  UpdateProfile? get updateProfile => _updateProfile;

  set updateProfile(UpdateProfile? value) {
    _updateProfile = value;
  }

  final GlobalKey<FormState>_formPass = GlobalKey<FormState>();

  GlobalKey<FormState> get formPass => _formPass;

  getprofile() async {
    SharedPreferences _sharedPreferences = await SharedPreferences
        .getInstance();
    user = _sharedPreferences.getInt("customerId");
    _profile = await ProfileRepo.getProfileRepo(customerId: user);
    _loading = true;
    _textEditingControllerName = TextEditingController(text: _profile!.name);
    _textEditingControllerEmail =
        TextEditingController(text: _profile!.userEmail);
    _textEditingControllerPhone = TextEditingController(text: _profile!.mobile);
    _textEditingControllerPassword = TextEditingController(text: _profile!.id);

    notifyListeners();
  }

  getProfileUpdate(BuildContext context) async {
    String name = _textEditingControllerName.text;
    String email = _textEditingControllerEmail.text;
    String password = _textEditingControllerPassword.text;
    String phone = _textEditingControllerPhone.text;
    _updateProfile = await UpdateProfileRepo.getUpdateProfileRepo(name: name,
        email: email,
        password: password,
        mobile: phone,
        customerId: user);
    if (_formPass.currentState!.validate()) {
      if (_updateProfile!.status == 1) {
        SharedPreferences sharedPreferences = await SharedPreferences
            .getInstance();
        sharedPreferences.setString("name", name);
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(_updateProfile!.reason.toString(),style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),

          ),duration: const Duration(milliseconds: 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          elevation: 10,
            onVisible: () {
              Navigator.pushAndRemoveUntil(context,
                  PageRouteBuilder(pageBuilder: (context, animation, widget) {
                    return FadeTransition(
                      opacity: animation,
                      child:
                      const HomePage(),

                    );
                  }), (route) => false);
            }));
        notifyListeners();
      }
    } else {
       MassageApp.flusherBarErrorMassage(context, _updateProfile!.reason.toString(),"", (flushbar) {

       });
       notifyListeners();
    }
  }


}
