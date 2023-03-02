import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/delegete/delegetorderowner.dart';

import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/delegete/orderaavailablevieProvide.dart';
import '../../widget/drawer.dart';
import 'orderavalibleview.dart';

class DelegateView extends StatefulWidget {
  const DelegateView({Key? key}) : super(key: key);

  @override
  State<DelegateView> createState() => _DelegateViewState();
}

class _DelegateViewState extends State<DelegateView>
    with SingleTickerProviderStateMixin {
  get key => null;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>OrderAvailableprovider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "الرئيسية",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 3,
          foregroundColor: Colors.black,
          leading:const DrewIcon(),
          bottom: TabBar(
              indicatorColor: Colors.teal,
              controller: tabController,
              tabs: const [
                Tab(
                    child: Text(
                  "إجمالي الطلبات",
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  "طلباتي",
                  style: TextStyle(color: Colors.black),
                )),
              ]),
        ),
        endDrawer: CustomDrawer(),
        body: TabBarView(controller: tabController, children: [
 const    OrderView(),
          DelegateOrderOwner(),
        ]),
      ),
    );
  }
}

class DrewIcon extends StatelessWidget {
  const DrewIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
        color: Colors.teal,
        onPressed: ()  {
          context
              .read<OrderAvailableprovider>()
              .showOrderAvFromRepo();

        },

        icon: const Icon(Icons.refresh_sharp));
  }
}
