import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/delegete/orderaavailablevieProvide.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return    LayoutBuilder(builder: (context, BoxConstraints constraints) {
      var data = context.watch<OrderAvailableprovider>().data;
      context.watch<OrderAvailableprovider>().relodTable(context);
      var key;
      return context.watch<OrderAvailableprovider>().loading == true
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          key: key,
          displacement: 1,
          color: Colors.green,
          strokeWidth: 5,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 5,
          onRefresh: () async {
            return await context
                .read<OrderAvailableprovider>()
                .showOrderAvFromRepo();
          },
          child: ListView(
            children: [
              data!.isNotEmpty
                  ? Padding(
                padding: EdgeInsets.all(
                    constraints.maxWidth * .01),
                child: DataTable(
                  columnSpacing: 14,
                  dataRowColor: MaterialStateProperty.all(
                      Colors.green.shade50.withOpacity(0.5)),
                  dataRowHeight: 45,
                  border: TableBorder.all(
                    color: Colors.black38,
                    width: 1,
                    borderRadius: BorderRadius.circular(
                        constraints.maxWidth * .03),
                  ),
                  dividerThickness: 2.0,
                  columns: [
                    DataColumn(
                      tooltip:
                      "الايقونه الاولي بتقوم بعرض بيانات الطلب والايقونه الثانيه عند الضغط عليها بيتم الموافقه علي الطلب ",
                      label: Padding(
                        padding: EdgeInsets.only(
                            left: constraints.minWidth * .01),
                        child: Text("اوافق علي الطلب",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(
                              left: constraints.minWidth * .01),
                          child: const Text("المنطقه",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal),
                              textAlign: TextAlign.center),
                        )),
                    DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(
                              left: constraints.minWidth * .03),
                          child: const Text("العميل",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal),
                              textAlign: TextAlign.center),
                        )),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.only(
                            left: constraints.minWidth * .01),
                        child: const Text("رقم الطلب",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    data.length,
                        (index) => DataRow(cells: [
                      DataCell(
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                context
                                    .read<
                                    OrderAvailableprovider>()
                                    .tackOrderFromRepo(
                                    context: context,
                                    index: data[index]
                                        .orderId);
                              },
                              icon: Image.asset(
                                "assets/image/verify.png",
                                height:
                                constraints.minHeight *
                                    .06,
                                width: constraints.minWidth *
                                    .06,
                              ),
                            ),
                            IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                context
                                    .read<
                                    OrderAvailableprovider>()
                                    .showOrderDetails(
                                    context: context,
                                    index: index);
                              },
                              icon: Image.asset(
                                "assets/image/icons8-popup-64.png",
                                height:
                                constraints.minHeight *
                                    .06,
                                width: constraints.minWidth *
                                    .06,
                              ),
                              iconSize: 4,
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            context
                                .read<
                                OrderAvailableprovider>()
                                .showOrderDetails(
                                context: context,
                                index: index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth * .15,
                            child: FittedBox(
                              child: Text(
                                  data[index]
                                      .regionName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow.ellipsis,
                                style:const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            context
                                .read<
                                OrderAvailableprovider>()
                                .showOrderDetails(
                                context: context,
                                index: index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth * .15,
                            child: FittedBox(
                              child: Text(
                                  data[index]
                                      .customerName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow.ellipsis,
                                style:const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            context
                                .read<
                                OrderAvailableprovider>()
                                .showOrderDetails(
                                context: context,
                                index: index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth * .15,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                  data[index]
                                      .orderId
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow.ellipsis,
                                style:const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
                  : Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: constraints.maxHeight / 4),
                  alignment: Alignment.center,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * .40,
                  child:Text("empty"),
                ),
              ),
            ],
          ),
        ),
      )
          : const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      );
    });
  }

}
