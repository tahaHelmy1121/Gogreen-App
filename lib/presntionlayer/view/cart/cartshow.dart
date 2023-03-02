import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/cart/cartprovider.dart';
import '../../widget/drawer.dart';
import '../home/home.dart';
import 'cartitem.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
        }, icon:Icon(Icons.arrow_back),

        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "سلة الكراكيب",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: ChangeNotifierProvider(
        child: CartItem(),
        create: (context) => CartProvider(context, context.read),
      ),
    );
  }
}
