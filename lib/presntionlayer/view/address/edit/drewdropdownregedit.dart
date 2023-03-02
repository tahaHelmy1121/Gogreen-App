import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../busnieslogiclayer/address/editaddressprovider.dart';

Widget drewDropDownRegionEdit(
    {var height, width, required BuildContext context}) {

   var regSelect= context.watch<EditAddressProvider>().regionSelect;
  return Container(
    margin: EdgeInsets.only(top: height*.01),
    alignment: Alignment.center,
    height: height * .06,
    width: width*.45 ,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey.shade200,

    ),
    child: DropdownButton(
      isExpanded: true,
      alignment: Alignment.center,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      iconEnabledColor: Colors.black38,
      underline: Container(),
      elevation: 8,
      value: context.watch<EditAddressProvider>().regionSelect,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context
          .watch<EditAddressProvider>()
          .regionData!
          .map((var items) {
        return DropdownMenuItem(
          alignment: Alignment.center,
          value: items.id,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .01),
            child: Text(
              items.name.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      onChanged: (var z) {

        context.read<EditAddressProvider>().regionSelect = z;
        context.read<EditAddressProvider>().getDisFromRepo(x: z);
      },
    ),
  );
}