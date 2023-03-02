import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../busnieslogiclayer/address/editaddressprovider.dart';
import '../../../../customwidget/style.dart';
import '../../../../datalayer/model/address/Address.dart';
import '../../../widget/drawer.dart';
import '../add/widget/drewHomeNumberInput.dart';
import '../add/widget/drewaddressstreet.dart';
import '../add/widget/drewdropdowngovernments.dart';
import '../add/widget/drewdropdownreg.dart';
import '../add/widget/drewdropdwondis.dart';
import '../add/widget/drewfloat.dart';
import '../add/widget/drewimageaddaddress.dart';
import '../add/widget/drewlocationdetails.dart';
import '../add/widget/special marque.dart';
import 'drewdropdowngovedit.dart';
import 'drewdropdownregedit.dart';
import 'drewdropdwondisedit.dart';

class EditAddressView extends StatefulWidget {
  Addresses? addressOne;

  EditAddressView({Key? key, this.addressOne}) : super(key: key);

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => EditAddressProvider(

      ),
      child: LayoutBuilder(
        builder: (context, BoxConstraints boxConstraints) {
          return Scaffold(

            endDrawer: CustomDrawer(),
            appBar:AppBar(
              backgroundColor: Colors.green,
              centerTitle: true,
              title: Text("تعديل العنوان"),

            ),
            body: SingleChildScrollView(
                child: DrewEditAddress(
                  addresses: widget.addressOne,
                  width: boxConstraints.maxWidth,
                  heght: boxConstraints.maxHeight,
                )),
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }
}

class DrewEditAddress extends StatefulWidget {
  var heght, width;

  Addresses? addresses;

  DrewEditAddress({Key? key, this.heght, this.width, this.addresses})
      : super(key: key);

  @override
  State<DrewEditAddress> createState() => _DrewEditAddressState();
}

class _DrewEditAddressState extends State<DrewEditAddress> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? textEditingController =
    TextEditingController(text: widget.addresses!.streetAddress.toString());
    TextEditingController? textEditingSpecial =
    TextEditingController(text: widget.addresses!.specialMarque.toString());
    TextEditingController? textEditinghomeNum =
    TextEditingController(text: widget.addresses!.buildingNumber.toString());
    TextEditingController? textEditingControllerRole =
    TextEditingController(text: widget.addresses!.roleNumber.toString());
    return SingleChildScrollView(
      child: Container(
          height: widget.heght,
          width: widget.width,
          child: context.watch<EditAddressProvider>().disLoad == true
              ? Form(
              key: context.watch<EditAddressProvider>().formKey,
              child: Padding(
                padding: EdgeInsets.all(widget.width * .02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    drewDropDownGovEdit(
                      context: context,
                      height: widget.heght,
                      width: widget.width,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: widget.heght*.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          drewDropDownDisEdit(
                            context: context,
                            height: widget.heght,
                            width: widget.width,
                          ),
                          drewDropDownRegionEdit(
                            context: context,
                            height: widget.heght,
                            width: widget.width,
                          ),
                       ],
                      ),
                    ),
                    SizedBox(height: 14,),
                    drewAddressStreet(context),
                    SizedBox(height: 14,),
                    drewmarque(context),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        drewHomeNumberInput(context),
                        drewFloat(context)
                      ],
                    ),
                    SizedBox(height: widget.heght * .01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // context
                          //     .read<EditAddressProvider>()
                          //     .getLocation(context);
                        },

                        child:drewLocation(context)

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: widget.heght * .03,
                          right: widget.width * .04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.scale(
                            scale: widget.width * .003,
                            child: Consumer<EditAddressProvider>(
                                builder: (context, check, widget) {
                                  return Checkbox(
                                    value: check.isChecked,
                                    onChanged: (value) {
                                      check.isChecked = value ?? true;
                                    },
                                    checkColor: Colors.white,
                                    hoverColor: Colors.green.shade50,
                                    fillColor:
                                    MaterialStateProperty.all(Colors.green),
                                    // splashRadius:2,
                                    shape: CircleBorder(),
                                  );
                                }),
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
                    SizedBox(height: widget.heght * .06),
                    InkWell(
                      onTap: () {
                        var name = textEditingController.text;
                        var special = textEditingSpecial.text;
                        var buildNumber = textEditinghomeNum.text;
                        var roleNumber = textEditingControllerRole.text;
                        context
                            .read<EditAddressProvider>()
                            .updateAddressFromRepo(
                          id: widget.addresses!.id,
                          regionId: context.read<EditAddressProvider>().regionSelect,
                          governorateId:
                          context.read<EditAddressProvider>().govSelected,
                          districtId: context.read<EditAddressProvider>().disSelect,
                          name: name,
                          buildingNumber: buildNumber,
                          specialMarque: special,
                          roleNumber: roleNumber,
                          context: context,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 220,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          "تعديل العنوان",
                          style: CustomTitleStyle.customTitleStyle(
                              color: Colors.white, size:12),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
              : Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )),
    );
  }
}
