
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:provider/provider.dart';

Widget drewmarque(BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    width: width*0.8,
    //   height: height*0.2,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
    ),
    child:TextFormField(

      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "أدخل علامة مميزة ";
        }
        return null;
      },
      controller:context.read<AddressProvider>().textEditingControllerPoint,

      textDirection: TextDirection.rtl,
      keyboardType: TextInputType.name,
      style: GoogleFonts.almarai(
          fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
      textAlign: TextAlign.right,
      decoration:  InputDecoration(
        errorStyle: TextStyle(
            fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
        hintText: "علامة مميزة",
        hintStyle: TextStyle(
          color: Colors.black38,
        ),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        // enabledBorder: InputBorder(),
        prefixIcon: Icon(Icons.map),
      ),
    ),
  );


}