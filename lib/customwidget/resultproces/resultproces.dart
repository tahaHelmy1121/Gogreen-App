import 'package:flutter/material.dart';

class ResultProcess {
  static drewResultProcess(
      {required BuildContext context, var reson, status, Widget? nav}) {
    if (status == 1) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
            content: Text(
              reson!.toString(),
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
          ))
          .closed
          .then((value) {
        Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, widget) {
          return FadeTransition(
            opacity: animation,
            child: nav,
          );
        }), (route) => false);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Text(
          reson.toString(),
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        elevation: 10,
        duration: const Duration(seconds: 1),
      ));
    }
  }
}
