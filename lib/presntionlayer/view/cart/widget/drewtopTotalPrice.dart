import 'package:flutter/material.dart';

Widget drewTopTotalPrice(
    {var height, width, required String totalPriceCart}) {
  return Container(
    height: 20,
    width: 100,
    alignment: Alignment.center,
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text(
        "إجمالي السعر :${totalPriceCart.toString()}",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.green),
      ),
    ),
  );
}