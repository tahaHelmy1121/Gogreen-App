



      import 'package:flutter/cupertino.dart';

Widget drewProdcutDetails({ context,name, Color? color }){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
 return  Container(
    height: height * .03,
    width: width * .40,
    alignment: Alignment.center,
    margin:
    EdgeInsets.symmetric(vertical: width * .01,horizontal: 15),
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text("$name",

          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(
            color:color,
              fontSize: 14,
              letterSpacing: 3,
              fontWeight: FontWeight.bold)),
    ),
  );
}