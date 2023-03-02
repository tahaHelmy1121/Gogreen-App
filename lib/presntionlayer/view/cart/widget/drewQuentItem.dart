import 'package:flutter/material.dart';

Widget drewQunItem(
    {required BuildContext context, required String qun, height, width}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1),
    alignment: Alignment.centerRight,
    height: height * .05,
    width: width * .20,
    child: Text(
      "${qun.toString()}كمية",
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(fontSize: 14, letterSpacing: 1),
    ),
  );
}