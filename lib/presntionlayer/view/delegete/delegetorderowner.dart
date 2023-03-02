import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/delegete/orderdelegateprovider.dart';
import '../../../customwidget/style.dart';

class DelegateOrderOwner extends StatelessWidget {
  DelegateOrderOwner({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  var refu = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderDelegateProvider(),
      child: LayoutBuilder(builder: (context, constrain) {
        var data = context.watch<OrderDelegateProvider>().myOrder;
        var loading = context.watch<OrderDelegateProvider>().myOrderLoading;
        return loading
            ? RefreshIndicator(
                key: key,
                displacement: 1,
                color: Colors.green,
                strokeWidth: 5,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 5,
                onRefresh: () async {
                  return await context
                      .read<OrderDelegateProvider>()
                      .getMyOrderFromRepo();
                },
                child: data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, position) {
                          var x;
                          var orderStatus;
                          if ((data[position].createDateTime != null)) {
                            DateTime? orderState = DateTime.parse(
                                data[position].createDateTime.toString());
                            orderStatus = DateFormat().format(orderState);
                            DateTime dt = DateTime.parse(
                                data[position].createDateTime.toString());
                            x = DateFormat().format(dt);
                          }
                          var tackOrder;
                          var orderTack;
                          if ((data[position].tackorderDate != null)) {
                            DateTime? orderState = DateTime.parse(
                                data[position].tackorderDate.toString());
                            orderTack = DateFormat().format(orderState);
                            DateTime dt = DateTime.parse(
                                data[position].tackorderDate.toString());
                            tackOrder = DateFormat().format(dt);
                          }
                          var ordS;
                          var orderTackX;
                          if ((data[position].orderstatusDate != null)) {
                            DateTime? orderState = DateTime.parse(
                                data[position].orderstatusDate.toString());
                            orderTackX = DateFormat().format(orderState);
                            DateTime dt = DateTime.parse(
                                data[position].orderstatusDate.toString());
                            ordS = DateFormat().format(dt);
                          }

                          return Container(
                            height: constrain.maxHeight * .50,
                            width: constrain.maxWidth,
                            margin: EdgeInsets.all(constrain.minWidth * .01),
                            child: Stack(
                              children: [
                                Card(
                                  color: Colors.grey.shade100,
                                  elevation: 4,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: constrain.minWidth * .02),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position].phone.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  رقم الهاتف",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  // textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(data[position].name,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  أسم العميل",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  // textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position].districtname,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  الحي",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position]
                                                      .regionname
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  المنطقة",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: constrain.minHeight * .001,
                                          width: constrain.minWidth - 10,
                                          color: Colors.black12,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position]
                                                      .specialMarque
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  علامه",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position].streetAddress,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  العنوان",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  // textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position]
                                                      .roleNumber
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  الدور",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position]
                                                      .buildingNumber
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":  رقم العماره",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  // textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: constrain.minHeight * .001,
                                          width: constrain.minWidth - 10,
                                          color: Colors.black12,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(x.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":   تاريخ الطلب",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(
                                                  data[position]
                                                      .orderStatustext
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            Container(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .20,
                                              child: const Text(":   حاله الطلب ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        data[position].tackorderDate != null
                                            ? Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment:
                                              Alignment.centerRight,
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .40,
                                              child: Text(
                                                  tackOrder.toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            Container(
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: const Text(
                                                  ":   تاريخ موافقة المندوب علي الطلب ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        )
                                            : SizedBox(),
                                        data[position].orderstatusDate != null
                                            ? Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment:
                                              Alignment.centerRight,
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(ordS.toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            Container(
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .32,
                                              child: const Text(
                                                  ":   تاريخ اخر حاله للطلب ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.teal,
                                                  )),
                                            ),
                                          ],
                                        )
                                            : SizedBox(),
                                        Container(
                                          height: constrain.minHeight * .001,
                                          width: constrain.minWidth - 10,
                                          color: Colors.black12,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(
                                                  data[position]
                                                      .orderPoint
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            Container(
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .23,
                                              child: Text(":   إجمالي النقاط ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Colors.red.shade900,
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        data[position].taxValue == 0
                                            ? SizedBox()
                                            : Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment:
                                              Alignment.centerRight,
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(
                                                  data[position]
                                                      .taxValue
                                                      .toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            Container(
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .23,
                                              child: Text(":   الضريبة ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                    Colors.red.shade900,
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        data[position].shippingCost == 0
                                            ? SizedBox()
                                            : Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment:
                                              Alignment.centerRight,
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .50,
                                              child: Text(
                                                  data[position]
                                                      .shippingCost
                                                      .toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            Container(
                                              height:
                                              constrain.minHeight * .03,
                                              width: constrain.minWidth * .23,
                                              child: Text(":   قيمه الشحن ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                    Colors.red.shade900,
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: constrain.minHeight * .03,
                                              width: constrain.minWidth * .25,
                                              child: Text(
                                                  data[position]
                                                      .fullTotal
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: constrain.minHeight * .03,
                                                width: constrain.minWidth * .23,
                                                child: Text(":   إجمالي الطلب ",
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: Colors.red.shade900,
                                                      fontSize: 14,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: constrain.minWidth * .02),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: constrain.maxHeight * .07,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        constrain.minWidth * .04),
                                                    topLeft: Radius.circular(
                                                        constrain.minWidth * .04)),
                                                gradient: LinearGradient(colors: [
                                                  Colors.grey.shade200,
                                                  Colors.grey.shade300,
                                                ])),
                                            child:
                                            data[position].orderStatus == 3 ||
                                                data[position]
                                                    .orderStatus !=
                                                    4
                                                ? Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                              children: [
                                                data[position].orderStatus ==
                                                    3 ||
                                                    data[position]
                                                        .orderStatus ==
                                                        4
                                                    ? SizedBox()
                                                    : MaterialButton(
                                                    elevation: 5,
                                                    disabledColor:
                                                    Colors
                                                        .black54,
                                                    height: 30,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            constrain
                                                                .minWidth *
                                                                .04)),
                                                    color: Colors
                                                        .red.shade900,
                                                    onPressed: () {
                                                      AwesomeDialog(
                                                        dismissOnBackKeyPress:
                                                        true,
                                                        dismissOnTouchOutside:
                                                        false,
                                                        keyboardAware:
                                                        true,
                                                        context:
                                                        context,
                                                        dialogType:
                                                        DialogType
                                                            .ERROR,
                                                        animType: AnimType
                                                            .BOTTOMSLIDE,
                                                        body:
                                                        Form(
                                                            key:
                                                            formKeys,
                                                            child:
                                                            Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  'قم بادخال سبب الغاء الطلب',
                                                                  style: CustomTitleStyle.customTitleStyle(size: 16, color: Colors.teal),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: constrain.minWidth * .01),
                                                                  child: TextFormField(
                                                                    validator: (String? value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return "سبب الإلغاء ";
                                                                      }
                                                                      refu = value;
                                                                      return null;
                                                                    },
                                                                    keyboardType: TextInputType.name,
                                                                    style: GoogleFonts.almarai(fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
                                                                    textAlign: TextAlign.right,
                                                                    decoration: const InputDecoration(
                                                                      errorStyle: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
                                                                      hintStyle: TextStyle(
                                                                        color: Colors.black38,
                                                                      ),
                                                                      filled: true,
                                                                      border: InputBorder.none,
                                                                      // enabledBorder: InputBorder(),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    MaterialButton(
                                                                        elevation: 5,
                                                                        disabledColor: Colors.black54,
                                                                        height: 30,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constrain.minWidth * .04)),
                                                                        color: Colors.red.shade700,
                                                                        onPressed: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: const Text(
                                                                          "إلغاء",
                                                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                                                        )),
                                                                    SizedBox(
                                                                      width: constrain.minWidth * .04,
                                                                    ),
                                                                    MaterialButton(
                                                                        elevation: 5,
                                                                        disabledColor: Colors.black54,
                                                                        height: 30,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constrain.minWidth * .04)),
                                                                        color: Colors.green.shade700,
                                                                        onPressed: () {
                                                                          if (formKeys.currentState!.validate()) {
                                                                            Navigator.pop(context);
                                                                            context.read<OrderDelegateProvider>().orderStateFromRepo(orderId: data[position].id, orderStatus: 1, context: context, reasonRefuse: refu);
                                                                          }
                                                                        },
                                                                        child: const Text(
                                                                          "إعتماد الإلغاء",
                                                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            )),
                                                      ).show();
                                                    },
                                                    child: const Text(
                                                      "إلغاء",
                                                      textAlign:
                                                      TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontSize:
                                                          12),
                                                    )),
                                                data[position].orderStatus ==
                                                    4 ||
                                                    data[position]
                                                        .orderStatus ==
                                                        2
                                                    ? SizedBox()
                                                    : MaterialButton(
                                                    elevation: 5,
                                                    disabledColor:
                                                    Colors
                                                        .black54,
                                                    height: 30,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            constrain
                                                                .minWidth *
                                                                .04)),
                                                    color: Colors
                                                        .green
                                                        .shade700,
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                          OrderDelegateProvider>()
                                                          .orderStateFromRepo(
                                                          orderId:
                                                          data[position]
                                                              .id,
                                                          orderStatus:
                                                          4,
                                                          context:
                                                          context);
                                                    },
                                                    child: const Text(
                                                      "تسليم الطلب للإدارة",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontSize:
                                                          12),
                                                    )),
                                                data[position].orderStatus ==
                                                    3 ||
                                                    data[position]
                                                        .orderStatus ==
                                                        4
                                                    ? SizedBox()
                                                    : MaterialButton(
                                                    elevation: 5,
                                                    height: 30,
                                                    disabledColor:
                                                    Colors
                                                        .black54,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            constrain
                                                                .minWidth *
                                                                .04)),
                                                    color: Colors
                                                        .green
                                                        .shade600,
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                          OrderDelegateProvider>()
                                                          .orderStateFromRepo(
                                                          orderId:
                                                          data[position]
                                                              .id,
                                                          orderStatus:
                                                          3,
                                                          context:
                                                          context);
                                                    },
                                                    child: const Text(
                                                      "تم الإستلام من العميل",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontSize:
                                                          12),
                                                    )),
                                              ],
                                            )
                                                : Text(
                                                "تم تسليم الطلب للإدارة ",
                                                style: CustomTitleStyle
                                                    .customTitleStyle(
                                                    color: Colors
                                                        .red.shade800,
                                                    size: 14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                data[position].longitude!=null||  data[position].longitude!=null?  IconButton(onPressed: (){
                                  context.read<OrderDelegateProvider>().showLocation(index:position);
                                }, icon: Image.asset("assets/image/icons8-map-64.png",fit: BoxFit.cover,),):SizedBox()
                              ],
                            ),
                          );
                        })
                    : Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: constrain.maxWidth,
                          height: constrain.maxHeight * .40,
                          child: Text("empty"),
                        ),
                      ),
              )
            : const Center(
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )),
              );
      }),
    );
  }
}
