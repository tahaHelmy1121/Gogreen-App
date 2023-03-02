import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/delegete/reportvieprovider.dart';

import 'package:provider/provider.dart';

import '../../widget/drawer.dart';

class ReportDelegate extends StatelessWidget {
  const ReportDelegate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReportDelegatepovide(),
      child: LayoutBuilder(builder: (context, constraints) {
        var data = context.watch<ReportDelegatepovide>().myOrder;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "تقرير للمندوب",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 3,
            foregroundColor: Colors.black,
          ),
          endDrawer: CustomDrawer(),
          body: context.watch<ReportDelegatepovide>().myOrderLoading
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: constraints.maxHeight * .13,
                        width: constraints.maxWidth,
                        margin:
                            EdgeInsets.only(top: constraints.minWidth * .02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      context
                                          .read<ReportDelegatepovide>()
                                          .selectDate(
                                              context: context, caseDate: 2);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: constraints.minWidth * .25,
                                      height: constraints.minHeight * .04,
                                      child: const Text(
                                        "التاريخ إلي ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    )),
                                Image.asset(
                                    "assets/images/icons8-planner-64.png",
                                    height: constraints.minHeight * .05,
                                    width: constraints.minWidth * .10,
                                    fit: BoxFit.cover),
                                InkWell(
                                    onTap: () {
                                      context
                                          .read<ReportDelegatepovide>()
                                          .selectDate(
                                              context: context, caseDate: 1);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: constraints.minWidth * .25,
                                      height: constraints.minHeight * .04,
                                      child: const Text(
                                        "التاريخ من ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    )),
                              ],
                            ),
                            MaterialButton(
                                disabledColor: Colors.black38,
                                height: 30,
                                minWidth: 100,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onPressed: context
                                                .read<ReportDelegatepovide>()
                                                .from ==
                                            null ||
                                        context
                                                .read<ReportDelegatepovide>()
                                                .to ==
                                            null
                                    ? null
                                    : () {
                                        context
                                            .read<ReportDelegatepovide>()
                                            .search();
                                      },
                                child: const Text(
                                  "بحث",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.teal),
                          ],
                        ),
                      ),
                      data!.isNotEmpty
                          ? Padding(
                              padding:
                                  EdgeInsets.all(constraints.minWidth * .02),
                              child: DataTable(
                                columnSpacing: 15,
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
                                    label: Padding(
                                      padding: EdgeInsets.only(
                                          left: constraints.minWidth * .06),
                                      child: const Text("حالة الطلب",
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
                                      Container(
                                        alignment: Alignment.center,
                                        height: constraints.minHeight * .05,
                                        width: constraints.maxWidth * .30,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Text(
                                            data[index]
                                                .orderStatustext
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<ReportDelegatepovide>()
                                              .showOrderDetails(
                                                  context: context,
                                                  index: index);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: constraints.maxWidth * .15,
                                          child: FittedBox(
                                            child: Text(
                                              data[index].regionname.toString(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<ReportDelegatepovide>()
                                              .showOrderDetails(
                                                  context: context,
                                                  index: index);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: constraints.maxWidth * .15,
                                          child: FittedBox(
                                            child: Text(
                                              data[index].name.toString(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<ReportDelegatepovide>()
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
                                              data[index].id.toString(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
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
                                child: Text("aa"),
                              ),
                            )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
        );
      }),
    );
  }
}
