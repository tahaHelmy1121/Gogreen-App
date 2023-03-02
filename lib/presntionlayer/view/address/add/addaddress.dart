import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewHomeNumberInput.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewaddressstreet.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewdropdowngovernments.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewdropdownreg.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewdropdwondis.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewfloat.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewimageaddaddress.dart';
import 'package:project/presntionlayer/view/address/add/widget/drewlocationdetails.dart';
import 'package:project/presntionlayer/view/address/add/widget/special%20marque.dart';
import 'package:provider/provider.dart';
import '../../../../busnieslogiclayer/connectivty/statusapp/loadingScreen.dart';
import '../../../../customwidget/style.dart';
import '../../../widget/customButton.dart';
import '../../../widget/drawer.dart';

class AddAddress extends StatefulWidget {
  bool? sure = false;
  var fromscreenCart;

  AddAddress({Key? key, this.sure}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "اضافة عنوان ",
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 3,
              color: Colors.black,
            ),
          ),
        ),
        body: context.watch<AddressProvider>().disLoad == true
            ? ChangeNotifierProvider(
          create: (BuildContext context) => AddressProvider(context.read),
          child: SingleChildScrollView(
            child: Form(
              key: context.watch<AddressProvider>().formKey,
              child: Column(
                children: [
                  drewImageAddress(context),
                  SizedBox(
                    height: 18,
                  ),
                  drewGov(context: context, width: 100, height: 88),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      drewDropDownDis(context: context),
                      drewDropDownRegion(context: context)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  drewAddressStreet(context),
                  SizedBox(
                    height: 25,
                  ),
                  drewmarque(context),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      drewHomeNumberInput(context),
                      drewFloat(context)
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  drewLocation(context),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.scale(
                          scale: 1.6,
                          child: Consumer<AddressProvider>(
                            builder: (context, check, widget) {
                              return Checkbox(
                                fillColor: MaterialStateProperty.all(
                                    Colors.green),
                                splashRadius: 2,
                                shape: CircleBorder(),
                                checkColor: Colors.white,
                                hoverColor: Colors.green.shade50,
                                value: check.isChecked,
                                onChanged: (value) {
                                  check.isChecked = value ?? true;
                                },
                              );
                            },
                          ),
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "عنوان اساسي ",
                              style: CustomTitleStyle.customTitleStyle(
                                  size: 14),
                            )),
                      ],
                    ),
                  ),
                  CustomButton(
                      onPressed: () {
                        context
                            .read<AddressProvider>()
                            .addAddress(context, widget.fromscreenCart);
                      },
                      text: "اضافةعنوان",
                      mycolor: Colors.black26)
                ],
              ),
            ),
          ),
        )
            : LoadingScreen());
  }
}
