import 'package:flutter/material.dart';
import 'package:project/datalayer/model/auth/forgetpassword.dart';
import 'package:provider/provider.dart';

import '../../customwidget/constient/massage.dart';
import '../../datalayer/repostory/auth/forgetpass/forgetpass.dart';

class ForgetProvider extends ChangeNotifier {
  late final Locator reader;
  late final Locator cartReader;


  ForgetProvider(this.reader, this.cartReader);

  TextEditingController? get textEditingControllerForgetPass =>
      _textEditingControllerForgetPass;

  ForgetPassWord? get forgetPassword => _forgetPassword;

  final GlobalKey<FormState> _formPass = GlobalKey<FormState>();
  ForgetPassWord? _forgetPassword;

  final TextEditingController? _textEditingControllerForgetPass =
  TextEditingController();

  GlobalKey<FormState> get formPass => _formPass;

  forgetPass(context) async {
    if (_formPass.currentState!.validate()) {
      String email = textEditingControllerForgetPass!.text;
      ForgetPassword?_forgetPassword = await ForgetPassWord.getForgetRepo(
          email: email);
      if (_forgetPassword!.status == -3) {
        MassageApp.flusherBarErrorMassage(context, _forgetPassword.reason, "", (flushbar) {

        });
        notifyListeners();
      } else {
       MassageApp.flusherBarErrorMassage(context, _forgetPassword.reason, "", (flushbar) {

       });
        notifyListeners();
      }
    }
  }


}
