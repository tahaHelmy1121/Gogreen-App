import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/order/widget/drewprodcu.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../busnieslogiclayer/connectivty/statusapp/loadingScreen.dart';
import '../../../busnieslogiclayer/order/orderprovider.dart';
import '../../../datalayer/model/order/oredrmodel.dart';
import '../../../datalayer/repostory/order/ordermodelrepo.dart';
import '../../widget/drawer.dart';
import 'orderdetails.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var orderShow = context
        .watch<OrderProvider>()
        .orders;
    return context
        .watch<OrderProvider>()
        .loading == true
        ? ChangeNotifierProvider(
        create: (context) => OrderProvider(),
        child: Scaffold(
          endDrawer: CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white12,
            title: Text("عرض الطلبات", style: TextStyle(
                fontSize: 18, color: Colors.black, letterSpacing: 4),),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(

                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.9,
                    child: ListView.builder(
                        itemCount: orderShow!.length,
                        itemBuilder: (context, position) {
                          DateTime dt = DateTime.parse(
                              orderShow[position].createDateTime.toString());
                          var x = DateFormat().format(dt);
                          /////////////////////////////////////////////

                          var orderStatus;
                          if ((orderShow[position].orderstatusDate != null)) {
                            DateTime? orderState = DateTime.parse(
                                orderShow[position].orderstatusDate.toString());
                            orderStatus = DateFormat().format(orderState);
                          }
                          return InkWell(
                          onTap: ()async{
                          OrdersDetailModel ordersDetailModel;
                          SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                          var customer =
                          sharedPreferences.getInt("customerId");
                          ordersDetailModel =
                          (await OrdersUserRepo.getUserOrdersDetails(
                          customerId: customer,
                          id: orderShow[position].id))!;
                          Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                          return FadeTransition(
                          opacity: animation,
                          child: OrderDetailsUser(
                          ordersDetailModel: ordersDetailModel),
                          );
                          }));

                          },
                          child: ItemOrder(
                                         x: x.toString(),
                          orderTotal: orderShow[position].orderTotal,
                          orderpoint: orderShow[position].orderPoint,
                          orderstate: orderShow[position].orderStatustext,
                          totalorder: orderShow[position].fullTotal,
                          context: context,),
                          );
                          }
                      //   }
                    ),
                  ),
                ),

              ],
            ),
          ),
        ))
        : LoadingScreen();
  }


}
