import 'package:flutter/material.dart';
class DrewImageAuth extends StatelessWidget {
var height ;
var width ;
String ? image ;

DrewImageAuth({this.height, this.width,this.image});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: height,
      width:width,
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(image!),
            fit: BoxFit.contain),
      ),
    );
  }
}
