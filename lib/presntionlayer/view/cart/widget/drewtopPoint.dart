
import 'package:flutter/material.dart';

Widget drewTopPoint({var height, width, required String totalPoints}) {
  return Container(
    height: 20,
    width: 150,
    alignment: Alignment.center,
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text(
        "الحد الادني من النقاط :${totalPoints.toString()}",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.red),
      ),
    ),
  );
}