import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/order/widget/drewproductdestails.dart';
import 'package:shimmer/shimmer.dart';

import '../../../customwidget/constient/colors.dart';
import '../../../datalayer/model/order/oredrmodel.dart';
import '../../widget/drawer.dart';


class OrderDetailsUser extends StatefulWidget {
  OrdersDetailModel? ordersDetailModel;
  OrderDetailsUser({Key? key, this.ordersDetailModel,}) : super(key: key);

  @override
  State<OrderDetailsUser> createState() => _OrderDetailsUserState();
}

class _OrderDetailsUserState extends State<OrderDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Scaffold(
        endDrawer: CustomDrawer(),
        backgroundColor: Colors.white,
       appBar: AppBar(
         centerTitle: true,
         title: const Text("تفاصيل الطلب",style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           color: Colors.green,
           letterSpacing: 3
         ),),
         backgroundColor: Colors.white,
       ),
     //   endDrawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: boxConstraints.maxHeight * .01),
                child: Container(

                  height: boxConstraints.maxHeight * .65,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.ordersDetailModel!.products!.length,
                      itemBuilder: (context, position) {
                        return Container(
                            margin:
                            EdgeInsets.all(boxConstraints.maxWidth * .01),
                            height: boxConstraints.maxHeight * .30,
                            width: boxConstraints.maxWidth * .40,
                            child: Card(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Column(
                                        children: [

                                          drewProdcutDetails(
                                              name:"اسم المنتج :${widget.ordersDetailModel!.products![position].productName} " ,
                                              context: context
                                          ),
                                          drewProdcutDetails(
                                              name:"سعر المنتج :${widget.ordersDetailModel!.products![position].price} " ,
                                              context: context),
                                          drewProdcutDetails(
                                              name:"كمية المنتج :${widget.ordersDetailModel!.products![position].quantity} " ,
                                              context: context),
                                          drewProdcutDetails(
                                              name:"النقاط :${widget.ordersDetailModel!.products![position].points} " ,
                                              context: context,
                                              color: Colors.red),
                                          drewProdcutDetails(
                                              name:"اجمالى النقاط :${widget.ordersDetailModel!.products![position].totalPoint} " ,
                                              context: context,
                                              color: Colors.red),
                                          drewProdcutDetails(
                                            name:"الاجمالى :${widget.ordersDetailModel!.products![position].total} " ,
                                            context: context,
                                            //   color: Colors.red
                                          ),

                                        ],
                                      ),
                                      Container(
                                        width: boxConstraints.maxWidth * .45,
                                        height: boxConstraints.maxHeight * .25,
                                        margin: EdgeInsets.all(
                                            1),
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              10),
                                          child: CachedNetworkImage(

                                            alignment: Alignment.center,
                                            height: boxConstraints.maxHeight * .40,
                                            imageUrl: widget.ordersDetailModel!
                                                .products![position].productImage
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Shimmer(

                                              gradient:AppColor.shimmerGradient,
                                              child: Container(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Icon(Icons.image),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),





                                ],
                              ),
                            ));
                      }),
                ),
              ),

              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  width: boxConstraints.maxWidth*.85,
                  height: boxConstraints.maxHeight *.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                      gradient: AppColor.shimmerGradient
                     
                  ),
                  child: Column(
                    children: [
                      drewProdcutDetails(
                        name:"عنوان الطلب :${widget.ordersDetailModel!.governoratename} " ,
                        context: context,
                        //   color: Colors.red
                      ),
                      drewProdcutDetails(
                        name:"${widget.ordersDetailModel!.districtname}-${widget.ordersDetailModel!.regionname} " ,
                        context: context,),
                      drewProdcutDetails(
                        name:"رقم الدور${widget.ordersDetailModel!.roleNumber}-${widget.ordersDetailModel!.buildingNumber} رقم العمارة" ,
                        context: context,),
                  drewProdcutDetails(
                    name:"حالة الطلب :${widget.ordersDetailModel!.orderStatus} " ,
                    context: context,
                  ),
                  drewProdcutDetails(
                    name:"اجمالى النقاط :${widget.ordersDetailModel!.orderPoint} " ,
                    context: context,
                  ),

                  drewProdcutDetails(
                    name:"اجمالى الطلب :${widget.ordersDetailModel!.orderTotal} " ,
                    context: context,
                  ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
