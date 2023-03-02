import 'package:flutter/material.dart';

Widget drewTopTotalPoint({var height, width, required String totalPoints}) {
  return Container(
    height: 45,
    width: 120,
    alignment: Alignment.center,
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text(
        "إجمالي النقاط :${totalPoints.toString()}",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.grey),
      ),
    ),
  );
}