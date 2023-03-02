import 'package:flutter/material.dart';

Widget drewPointItem({required BuildContext context,
  required String itemPoint,
  height,
  width}) {
  return Container(
    alignment: Alignment.center,
    height: height * .03,
    width: width * .20,
    child: Text(
      "${itemPoint.toString()}نقطة - ",
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(fontSize: 14, letterSpacing: 1),
    ),
  );
}