import 'package:flutter/material.dart';

Widget drewPriceItem(
    {required BuildContext context,
      required String itemPrice,
      height,
      width}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(height * .011),
        bottomRight: Radius.circular(height * .011),
      ),
    ),
    margin: EdgeInsets.only(left: width * .01, top: height * .006),
    height: height * .03,
    width: width * .10,
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text("${itemPrice.toString()}ج ",
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 8, color: Colors.white)),
    ),
  );
}