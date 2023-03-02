import 'package:flutter/material.dart';

Widget drewTotalItem({required BuildContext context,
  var height,
  width,
  required String total}) {
  return Container(
      alignment: Alignment.center,
      height: height * .03,
      width: 180,
      child: Text(
        "${total.toString()}:إجمالي السعر",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontSize: 8, letterSpacing: 1),
      ));
}