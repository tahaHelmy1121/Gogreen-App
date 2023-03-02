import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:badges/badges.dart'as badges;

import '../../../busnieslogiclayer/cart/cartprovider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CartProvider>().tapIcon(context);
      },
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 5, end: 1,),
         badgeStyle: badges.BadgeStyle(
           shape: badges.BadgeShape.square,
           borderRadius: BorderRadius.circular(8),
           padding: EdgeInsets.all(3),
           badgeGradient: const badges.BadgeGradient.linear(
             colors: [
               Colors.purple,
               Colors.blue,
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           ),
         ),

        badgeContent: (context.read<CartProvider>().cartModel?.totalQuantity == null)
            ?const Text("0",style: TextStyle(color: Colors.white),)
            : Text(
          context
              .watch<CartProvider>()
              .cartModel!
              .totalQuantity>99?"+99":context
              .watch<CartProvider>()
              .cartModel!
              .totalQuantity
              .toString(),style: TextStyle(color: Colors.white,fontSize: 10),),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/image/icons8-buying-64.png",
            fit: BoxFit.cover,
            height: 22,
            width: 30,
          ),
        ),
      ),
    );
  }
}
