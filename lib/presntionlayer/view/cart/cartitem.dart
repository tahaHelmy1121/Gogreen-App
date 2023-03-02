import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/busnieslogiclayer/cart/cartprovider.dart';
import 'package:project/presntionlayer/view/cart/widget/drewImageProductCart.dart';
import 'package:project/presntionlayer/view/cart/widget/drewPointItem.dart';
import 'package:project/presntionlayer/view/cart/widget/drewPriceItem.dart';
import 'package:project/presntionlayer/view/cart/widget/drewQuentItem.dart';
import 'package:project/presntionlayer/view/cart/widget/drewTotalItem.dart';
import 'package:project/presntionlayer/view/cart/widget/drewTotalPoint.dart';
import 'package:provider/provider.dart';
import '../../../customwidget/style.dart';
import '../address/addressdetails.dart';
import 'widget/drewtopPoint.dart';
import '../home/widget/drewtopTotalPoint.dart';
import 'widget/drewtopTotalPrice.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return context.watch<CartProvider>().load == true
        ? Column(
            children: [
              Flexible(
                  child: context
                          .watch<CartProvider>()
                          .cartModel!
                          .products!
                          .isNotEmpty
                      ? RefreshIndicator(
                          displacement: 1,
                          color: Colors.green,
                          strokeWidth: 5,
                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                          edgeOffset: 1,
                          onRefresh: () async {
                            return await context
                                .read<CartProvider>()
                                .getCart(context);
                          },
                          child: ListView.builder(
                              itemBuilder: (context, position) {
                                var data = context
                                    .watch<CartProvider>()
                                    .cartModel!
                                    .products;
                                return Container(
                                  height: height * .28,
                                  margin: EdgeInsets.symmetric(
                                      vertical: height * .01),
                                  child: Stack(children: [
                                    Card(
                                      elevation: 8,
                                      child: Padding(
                                        padding: EdgeInsets.all(width * .01),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: width * .08),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  drewNameItem(
                                                      context: context,
                                                      itemName: data![position]
                                                          .productName
                                                          .toString(),
                                                      height: height,
                                                      width: width),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      drewQunItem(
                                                          context: context,
                                                          qun: data[position]
                                                              .quantity
                                                              .toString(),
                                                          height: height,
                                                          width: width),
                                                      drewPointItem(
                                                          context: context,
                                                          itemPoint:
                                                              data[position]
                                                                  .points
                                                                  .toString(),
                                                          height: height,
                                                          width: width),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    CartProvider>()
                                                                .addCart(
                                                                    context:
                                                                        context,
                                                                    itemIndex:
                                                                        position,
                                                                    productId: data[
                                                                            position]
                                                                        .productId,
                                                                    remove:
                                                                        false);
                                                          },
                                                          icon: Icon(
                                                            Icons.remove_circle,
                                                            size: 18,
                                                            color: Colors
                                                                .red.shade600,
                                                          )),
                                                      FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Text(
                                                            data[position]
                                                                .quantity
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black)),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    CartProvider>()
                                                                .addCart(
                                                                    context:
                                                                        context,
                                                                    itemIndex:
                                                                        position,
                                                                    productId: data[
                                                                            position]
                                                                        .productId,
                                                                    remove:
                                                                        true);
                                                          },
                                                          icon: const Icon(
                                                            Icons.add_circle,
                                                            size: 18,
                                                            color: Colors.green,
                                                          )),
                                                    ],
                                                  ),
                                                  drewTotalPointItem(
                                                      context: context,
                                                      totalPoint: data[position]
                                                          .pointTotal
                                                          .toString(),
                                                      height: height,
                                                      width: width),
                                                  drewTotalItem(
                                                      context: context,
                                                      total: data[position]
                                                          .total
                                                          .toString(),
                                                      height: height,
                                                      width: width),
                                                ],
                                              ),
                                            ),
                                            drewImageProductCart(
                                                context: context,
                                                itemImage: context
                                                    .watch<CartProvider>()
                                                    .cartModel!
                                                    .products![position]
                                                    .productImage
                                                    .toString(),
                                                height: height,
                                                width: width),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        drewPriceItem(
                                            context: context,
                                            itemPrice:
                                                data[position].price.toString(),
                                            height: height,
                                            width: width),
                                        IconButton(
                                            onPressed: () {
                                              context
                                                  .read<CartProvider>()
                                                  .removeCart(
                                                      index:
                                                          data[position].cartId,
                                                      customer: data[position]
                                                          .customerId);
                                            },
                                            icon: Image.asset(
                                              "assets/image/icons8-remove-64.png",
                                              height: height * .05,
                                              width: width * .05,
                                            )),
                                      ],
                                    ),
                                  ]),
                                );
                              },
                              itemCount: context
                                  .watch<CartProvider>()
                                  .cartModel!
                                  .products!
                                  .length),
                        )
                      : Center(child: Lottie.asset("assets/lotti/waze.json"))),
              SizedBox(height: height * .01),
              context.watch<CartProvider>().cartModel!.products!.isNotEmpty
                  ? Container(
                      height: height * .18,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * .05),
                              topLeft: Radius.circular(width * .05))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: width * .04,
                            top: width * .02,
                            left: width * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: width * 0.2,
                              child: MaterialButton(
                                  elevation: 5,
                                  color: Colors.green,
                                  disabledColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * .05)),
                                  onPressed: (context
                                              .read<CartProvider>()
                                              .cartModel!
                                              .totalPoints >=
                                          100)
                                      ? () => Navigator.push(context,
                                              PageRouteBuilder(pageBuilder:
                                                  (context, anima, _) {
                                            return FadeTransition(
                                                opacity: anima,
                                                child: AddressDetails());
                                          }))
                                      : null,
                                  child: Text(
                                    "التالي",
                                    style: CustomTitleStyle.customTitleStyle(
                                        size: 14, color: Colors.white),
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    drewTopTotalPoint(
                                        totalPoints: context
                                            .watch<CartProvider>()
                                            .cartModel!
                                            .totalPoints
                                            .toString(),
                                        height: height,
                                        width: width),
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    drewTopTotalPrice(
                                        totalPriceCart: context
                                            .watch<CartProvider>()
                                            .cartModel!
                                            .totalCart
                                            .toString(),
                                        height: height,
                                        width: width),
                                  ],
                                ),
                                drewTopPoint(
                                    totalPoints: context
                                        .watch<CartProvider>()
                                        .cartModel!
                                        .minimumpoints
                                        .toString(),
                                    height: height,
                                    width: width),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          )
        : Center(
            child: SizedBox(
                child: Lottie.asset("assets/lotti/98194-loading.json")),
          );
  }

  Widget drewNameItem(
      {required BuildContext context,
      var height,
      width,
      required String itemName}) {
    return Container(
        alignment: Alignment.center,
        height: height * .03,
        width: width * .25,
        child: Text(
          itemName.toString(),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 14, letterSpacing: 1),
        ));
  }
}
