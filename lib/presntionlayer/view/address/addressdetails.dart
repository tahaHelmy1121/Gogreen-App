import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:project/busnieslogiclayer/connectivty/statusapp/loadingScreen.dart';
import 'package:project/presntionlayer/view/address/add/addaddress.dart';
import 'package:provider/provider.dart';

import '../../widget/customButton.dart';
import '../../widget/drawer.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({Key? key}) : super(key: key);

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthtScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        endDrawer: CustomDrawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade800, Colors.green.shade800])),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "تفاصيل الطلب",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
        ),
        body: context.watch<AddressProvider>().disLoad == true
            ? ChangeNotifierProvider(
                create: (context) => AddressProvider(context.read),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 12),
                        width: widthtScreen * 0.3,
                        height: heightScreen * 0.2,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 4,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/image/undraw_Best_place_re_lne9.png"),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: widthtScreen * 0.2,
                            height: heightScreen * 0.2 / 2,
                            margin: const EdgeInsets.only(top: 28, left: 20),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.green),
                                borderRadius: BorderRadius.circular(20)),
                            child: DropdownButton(
                              alignment: Alignment.center,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              iconEnabledColor: Colors.black,
                              isExpanded: true,
                              underline: Container(),
                              elevation: 8,
                              value: context
                                  .watch<AddressProvider>()
                                  .selectednvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: context
                                  .watch<AddressProvider>()
                                  .myListAddress!
                                  .map((e) {
                                return DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: e.id,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          width: widthtScreen * 0.1,
                                          child: Text(
                                            e.districtName.toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          )),
                                      (e.districtName
                                              .toString()
                                              .contains("اضف عنوان"))
                                          ? const SizedBox()
                                          : const Text(""),
                                      Container(
                                        width: 8,
                                        alignment: Alignment.center,
                                        child: Text(
                                          e.regionName.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 8,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      e.streetAddress != null
                                          ? const Text("")
                                          : const SizedBox(),
                                      e.streetAddress != null
                                          ? SizedBox(
                                              width: 10,
                                              child: Text(
                                                e.streetAddress.toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (var x) {
                                if (x == 0) {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, widget) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: AddAddress(
                                        sure: true,
                                      ),
                                    );
                                  }));
                                } else {
                                  context
                                      .read<AddressProvider>()
                                      .selectednvalue = x;
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                  )
                                ],
                                // color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              "عنوان العميل",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  letterSpacing: 3),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120, top: 35),
                        child: Row(
                          children: [
                            CustomButton(
                              text: 'اتمام الطلب',
                              mycolor: Colors.green,
                              onPressed: () {
                                context
                                    .read<AddressProvider>()
                                    .getResponseOrderFromRepo(context: context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : LoadingScreen());
  }
}
