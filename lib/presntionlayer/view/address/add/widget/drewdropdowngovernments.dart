
          import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:provider/provider.dart';

Widget drewGov({var height , width , required BuildContext context}){
  var gov = context.watch<AddressProvider>().govSelected;
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
         return Container(
           margin: EdgeInsets.all(18),
           alignment: Alignment.center,
           height:height*0.2/2,
           width: width*0.9,
           decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   spreadRadius: 2,
                   blurRadius: 2,
                 )
               ],
             color: Colors.grey.shade200,
                 borderRadius: BorderRadius.circular(30)
           ),
           child: DropdownButton(
             isExpanded: true,
             alignment: Alignment.center,
             borderRadius: const BorderRadius.all(Radius.circular(5)),
             iconEnabledColor: Colors.black38,
             underline: Container(),
             elevation: 8,
             value: gov,
             icon: const Icon(Icons.keyboard_arrow_down),
             items: context.watch<AddressProvider>().myGov!.map((var items) {
               return DropdownMenuItem(
                 alignment: Alignment.center,
                 value: items.id,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal:10),
                   child: Text(
                     items.name.toString(),
                     textAlign: TextAlign.center,
                   ),
                 ),
               );
             }).toList(),
             onChanged: (var z) {
               context.read<AddressProvider>().govSelected = z;
               context.read<AddressProvider>().getRegionFromRepo(z);
             },
           ),

         );

          }