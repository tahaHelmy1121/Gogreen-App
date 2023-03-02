import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MassageApp {
  static focusNode(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMassage(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      backgroundColor: Colors.black12,
      textColor: Colors.white,
      fontSize: 12,
    );
  }

  static void flusherBarErrorMassage(
      BuildContext context, String massage, String tittleMassage, OnTap onTap) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(20),
          titleColor: Colors.black54,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: Colors.black54,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 30,
          message: massage,
          borderRadius: BorderRadius.circular(30),
          title: tittleMassage,
          messageColor: Colors.white,
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String massage, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          massage,
        )));
  }
}
