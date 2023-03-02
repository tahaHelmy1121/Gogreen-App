



    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drewPointAndQunt({point , qun}){

 return  Row(
    mainAxisAlignment:
    MainAxisAlignment
        .spaceEvenly,
    children: [
      Container(
        height: 30,
        width: 70,
        margin:
        const EdgeInsets
            .symmetric(
            vertical:
            5),
        alignment: Alignment
            .center,
        child: Text(
          "${point}  ونقطة",
          maxLines: 1,
          textDirection:
          TextDirection
              .rtl,
          overflow:
          TextOverflow
              .ellipsis,
          style: const TextStyle(
              fontSize: 10,
              color: Colors
                  .green),
        ),
      ),
      Container(
        height: 30,
        width: 50,
        margin:
        const EdgeInsets
            .symmetric(
            vertical:
            5),
        alignment: Alignment
            .center,
        child: Text(
          "${qun}قطع",
          style: const TextStyle(
              fontSize: 10,
              color: Colors
                  .black),
        ),
      ),
    ],
  );

    }