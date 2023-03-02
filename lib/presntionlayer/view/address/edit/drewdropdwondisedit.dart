import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/editaddressprovider.dart';

import 'package:provider/provider.dart';

Widget drewDropDownDisEdit({var height, width, required BuildContext context}) {
var disSelect= context.watch<EditAddressProvider>().disSelect;
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
      alignment: Alignment.center,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      iconEnabledColor: Colors.black38,
      underline: Container(),
      elevation: 8,
      value: context.watch<EditAddressProvider>().disSelect,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context
          .watch<EditAddressProvider>()
          .dissData!
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
        context.read<EditAddressProvider>().disSelect = z!;
      },
    ),
  );
}
