import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/editaddressprovider.dart';

import 'package:provider/provider.dart';

Widget drewDropDownGovEdit({var height, width, required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: height * .01),
    alignment: Alignment.center,
    height: height * .06,
    width: width,
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
      value: context.watch<EditAddressProvider>().govSelected,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context.watch<EditAddressProvider>().myGov!.map((var items) {
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
        context.read<EditAddressProvider>().govSelected = z;
        context.read<EditAddressProvider>().getRegionFromRepo(
            xId: context.read<EditAddressProvider>().govSelected,
            // regionId: context.read<EditAddressViewModel>().regionSelect,
            // dis: context.read<EditAddressViewModel>().disSelect


        );
      },
    ),
  );
}
