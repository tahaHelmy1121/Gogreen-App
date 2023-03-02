


    import 'package:flutter/material.dart';

Widget  drewImageAddress(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
       return     Container(
         margin: const EdgeInsets.only(left: 30, top: 12),
         width: width * 0.8,
         height: height * 0.2,
         decoration: BoxDecoration(

             borderRadius: BorderRadius.circular(50),
             image: const DecorationImage(
               image: AssetImage(
                   "assets/image/undraw_Best_place_re_lne9.png"),
             )),
       );


      }