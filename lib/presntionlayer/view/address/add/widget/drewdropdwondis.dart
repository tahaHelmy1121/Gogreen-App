import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:provider/provider.dart';


Widget drewDropDownDis({var height, width, required BuildContext context}) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  var disX =
      Provider.of<AddressProvider>(context, listen: true).disSelect;
  return Container(
    margin: EdgeInsets.only(top: 14),
    alignment: Alignment.center,
    height:height*0.1,
    width: width*0.3 ,
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
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      iconEnabledColor: Colors.black38,
      underline: Container(),
      elevation: 8,
      value: disX,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context
          .watch<AddressProvider>()
          .dissData!
          .map((var items) {
        return DropdownMenuItem(
          alignment: Alignment.center,
          value: items.id,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              items.name.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      onChanged: (var z) {
        context.read<AddressProvider>().disSelect = z;
      },
    ),
  );
}
