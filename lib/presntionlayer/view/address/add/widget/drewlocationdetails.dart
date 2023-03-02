




      import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../busnieslogiclayer/address/addressProvider.dart';

Widget drewLocation (BuildContext context){
  return  Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      child:Container(
        //   color: Colors.blue,
        height: 60,
        width: 150,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Image.asset(

                context.read<AddressProvider>().positionLoading==false ?"assets/image/icons8-location.gif":
                "assets/image/icons8-in-progress.gif",
                height: 65,
                width: 50,
                fit: BoxFit.cover,
              ),

            ),
            SizedBox(width: 15,),
            FittedBox(
              child: Text("حددموقعك ",style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  decoration:
                  TextDecoration.underline

              ),),
            )
          ],
        ),
      ) ,
      onTap: (){
        context.read<AddressProvider>().location(context);
      },
    ),
  );



}
