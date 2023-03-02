



    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drewProdcuctprice({price }){
  return  Container(
      margin:
      const EdgeInsets.only(
          left: 10, top: 10),
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration:
      const BoxDecoration(
        color: Colors.green,
        borderRadius:
        BorderRadius.only(
          topLeft:
          Radius.circular(10),
          bottomRight:
          Radius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
            "${price}ج ",
            textAlign:
            TextAlign.center,
            textDirection:
            TextDirection.rtl,
            maxLines: 1,
            overflow: TextOverflow
                .ellipsis,
            style: const TextStyle(
                fontSize: 12,
                color:
                Colors.white,
                fontWeight:
                FontWeight
                    .w600)),
      ));
}