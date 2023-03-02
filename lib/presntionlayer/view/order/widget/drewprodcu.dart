import 'package:flutter/material.dart';
import 'drewproductdestails.dart';

Widget ItemOrder(
    {x, orderTotal, orderpoint, orderstate, totalorder, context, id}) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Column(children: [
    const SizedBox(
      height: 12,
    ),
    Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade200),
      child: Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${x.toString()}",
                style: const TextStyle(
                    fontSize: 10, letterSpacing: 1, color: Colors.green),
              )
            ],
          ),
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "رقم الطلب",
                style: TextStyle(
                    fontSize: 15, letterSpacing: 3, color: Colors.green),
              )
            ],
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 14,
    ),
    Row(children: [
      Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              //    color: Colors.black,
              boxShadow: [
                BoxShadow(blurRadius: 1, color: Colors.grey.shade300)
              ],
              borderRadius: BorderRadius.circular(50)),
          //   color: Colors.black,
          width: width * 0.9,
          //    height: height*0.3,
          child: Card(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(height * .033),
                          bottomRight: Radius.circular(height * .030),
                        ),
                      ),
                      margin: EdgeInsets.only(left: width * .01, bottom: 85),
                      height: height * .04,
                      width: width * .10,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(" ج${orderTotal}",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white)),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [

                      Column(
                        children: [
                          drewProdcutDetails(
                              name: "$orderpoint:اجمالى النقاط",
                              context: context),
                          drewProdcutDetails(
                              name: "حالة الطلب :$orderstate", context: context),
                          drewProdcutDetails(
                              name: "$totalorder:اجمالى الطلب",
                              context: context),
                        ],
                      ),
                      Container(
                       color: Colors.white,
                        width: width*0.2,
                        height: height*0.2,
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/image/undraw_Order_delivered_re_v4ab.png",
                            fit: BoxFit.cover,
                            width: width*0.2,
                            height: height*0.2,
                          ),
                        ),
                      ),
                    ]),
                  ])))
    ])
  ]);
}
