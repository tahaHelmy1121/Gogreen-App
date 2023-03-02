


    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../busnieslogiclayer/cart/cartprovider.dart';
import 'drewnextbutton.dart';
import 'drewtopTotalPoint.dart';

Widget drewtotal(BuildContext context){
 return  Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        margin:
        const EdgeInsets.symmetric(vertical: 10),
        color: Colors.grey.shade200,
        height: 100,
        width: 350,
        alignment: Alignment.center,
        child: Container(
          width: 400,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: const Offset(
                      0, 3), // changes posi
                )
              ]),
          child: Row(
            children: [
              CustomNextButton(),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        (context
                            .watch<
                            CartProvider>()
                            .cartModel!
                            .totalPoints !=
                            null)
                            ? Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment
                              .centerRight,
                          child: Text(
                            "${context
                                .watch<CartProvider>()
                                .cartModel!
                                .totalPoints
                                .toString()}نقطة",
                            maxLines: 1,
                            overflow: TextOverflow
                                .ellipsis,
                            style:
                            const TextStyle(
                                fontSize: 12,
                                letterSpacing:
                                3),
                          ),
                        )
                            : const SizedBox(),
                        (context
                            .watch<
                            CartProvider>()
                            .cartModel!
                            .totalCart !=
                            null)
                            ? Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment
                              .centerRight,
                          child: Text(
                              "${context
                                  .watch<CartProvider>()
                                  .cartModel!
                                  .totalCart
                                  .toString()}جنية",
                              textAlign: TextAlign
                                  .center,
                              textDirection:
                              TextDirection
                                  .rtl,
                              maxLines: 1,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                              style:
                              const TextStyle(
                                  fontSize:
                                  14,
                                  color: Colors
                                      .green)),
                        )
                            : const SizedBox(),
                      ],
                    ),
                    drewTopTotalPoint(
                      totalPoints: context
                          .watch<CartProvider>()
                          .cartModel!
                          .totalCart
                          .toString(),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
  );
}