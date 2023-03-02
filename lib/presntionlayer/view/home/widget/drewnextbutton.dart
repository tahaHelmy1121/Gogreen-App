
    import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../busnieslogiclayer/cart/cartprovider.dart';
import '../../../../customwidget/style.dart';
import '../../../widget/customButton.dart';
import '../../cart/cartshow.dart';
         class CustomNextButton extends StatefulWidget {
           const CustomNextButton({Key? key}) : super(key: key);

           @override
           State<CustomNextButton> createState() => _CustomNextButtonState();
         }

         class _CustomNextButtonState extends State<CustomNextButton> {
           @override
           Widget build(BuildContext context) {
             var width = MediaQuery.of(context).size.width;
             return  Container(
               height: 30,
               width: 100,
               child:CustomButton(
                 mycolor:Colors.green ,
                 onPressed:(){
                   context
                                            .read<CartProvider>()
                                            .addCart(context: context);
                                        Navigator.of(context)
                                            .pushReplacement(
                                            MaterialPageRoute(
                                                builder: (con) =>
                                                    Cart()));
                 } ,
                 text:"التالى" ,
               )
             );
           }
         }


         //
