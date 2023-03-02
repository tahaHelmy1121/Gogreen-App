import 'package:flutter/material.dart';

Widget drewTotalPointItem(
    {required BuildContext context,
      var height,
      width,
      required String totalPoint}) {
  return Container(
      alignment: Alignment.center,
      height: 45,
      width:100,
      child: Text(
        "${totalPoint.toString()}:إجمالي النقاط",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontSize: 8, letterSpacing: 1),
      ));
}