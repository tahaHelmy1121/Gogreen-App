import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:project/busnieslogiclayer/category/categoryprovider.dart';
import 'package:project/presntionlayer/view/home/widget/drewimageproduct.dart';
import 'package:project/presntionlayer/view/home/widget/drewnameproduct.dart';
import 'package:project/presntionlayer/view/home/widget/drewpointandqun.dart';
import 'package:project/presntionlayer/view/home/widget/drewpriceproduct.dart';

import 'package:project/presntionlayer/view/home/widget/drewtotal.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../busnieslogiclayer/cart/cartprovider.dart';
import '../../../busnieslogiclayer/connectivty/statusapp/OffLineScreen.dart';
import '../../../busnieslogiclayer/connectivty/statusapp/loadingScreen.dart';
import '../../../busnieslogiclayer/connectivty/statusinternet/status.dart';
import '../../widget/drawer.dart';
import '../cart/iconview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<HomePageProvider>().myCategoryData;
    var networkStatus = context.watch<NetworkStatus>();
    if (context.watch<HomePageProvider>().catLoading == true) {
      return DefaultTabController(
        length: context.watch<HomePageProvider>().myCategoryData!.length,
        child: networkStatus == NetworkStatus.online
            ? LayoutBuilder(
                builder: (context, BoxConstraints constrain) => Scaffold(
                  endDrawer: CustomDrawer(),
                      appBar: AppBar(
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: CartIcon(),
                        ),
                        backgroundColor: Colors.grey.shade300,
                        centerTitle: true,
                        elevation: 0,
                        title: const Text(
                          "الرئيسية",
                          style:
                              TextStyle(color: Colors.green, letterSpacing: 3),
                        ),
                        bottom: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.green.shade50,
                            shape: BoxShape.circle,
                          ),
                          tabs: List.generate(
                              context
                                  .watch<HomePageProvider>()
                                  .myCategoryData!
                                  .length,
                              (e) => Tab(
                                    icon: CachedNetworkImage(
                                      height: constrain.minHeight * .04,
                                      width: constrain.maxWidth * .10,
                                      imageUrl: data![e].image.toString(),
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) => Shimmer(
                                        gradient: const LinearGradient(colors: [
                                          Colors.white,
                                          Colors.black26
                                        ]),
                                        child: Container(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.image),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Text(
                                        context
                                            .watch<HomePageProvider>()
                                            .myCategoryData![e]
                                            .name
                                            .toString(),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                            fontSize: 8),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      body: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            child: TabBarView(
                              children: List.generate(
                                context
                                    .watch<HomePageProvider>()
                                    .myCategoryData!
                                    .length,
                                (index) => Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  child: RefreshIndicator(
                                    displacement: 1,
                                    color: Colors.green,
                                    strokeWidth: 5,
                                    triggerMode:
                                    RefreshIndicatorTriggerMode.onEdge,
                                    edgeOffset: 1,
                                    onRefresh: () async {
                                      return await context
                                          .read<CartProvider>()
                                          .getCart(context);
                                    },
                                    child: AnimationLimiter(
                                      child: GridView.builder(
                                        itemCount:
                                            data![index].products!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 250,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,
                                          crossAxisCount: 2,
                                        ),
                                        itemBuilder: (context, position) {
                                          return Container(
                                            margin: EdgeInsets.all(
                                                constrain.maxWidth * .004),
                                            width: constrain.maxWidth / 3,
                                            height: 90,
                                            child: Stack(
                                              children: [
                                                Card(

                                                  shape: RoundedRectangleBorder(

                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40)),
                                                  elevation: 4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      drewImageProduct(
                                                          image: data[index]
                                                              .products![
                                                                  position]
                                                              .image),
                                                      drewnameproduct(
                                                        name: data[index]
                                                            .products![position]
                                                            .name,
                                                      ),
                                                      drewPointAndQunt(
                                                        qun: data[index]
                                                            .products![position]
                                                            .quantity,
                                                        point: data[index]
                                                            .products![position]
                                                            .points,
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .black),
                                                                ),
                                                                onPressed: () {
                                                                  context.read<HomePageProvider>().addCart(
                                                                      context:
                                                                          context,
                                                                      itemIndex:
                                                                          position,
                                                                      index:
                                                                          index,
                                                                      productId: data[
                                                                              index]
                                                                          .products![
                                                                              position]
                                                                          .id,
                                                                      remove:
                                                                          true);
                                                                },
                                                                child: const Icon(
                                                                    Icons.add),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          constrain.maxWidth *
                                                                              .005),
                                                              height: constrain
                                                                      .maxHeight *
                                                                  .05,
                                                              width: constrain
                                                                      .maxWidth *
                                                                  .12,
                                                              color:
                                                                  Colors.white,
                                                              child: FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child: Text(
                                                                    context
                                                                        .watch<
                                                                            HomePageProvider>()
                                                                        .myCategoryData![
                                                                            index]
                                                                        .products![
                                                                            position]
                                                                        .cartquantity
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .rtl,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight.w200)),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  context.read<HomePageProvider>().addCart(
                                                                      context:
                                                                          context,
                                                                      itemIndex:
                                                                          position,
                                                                      index:
                                                                          index,
                                                                      productId: data[
                                                                              index]
                                                                          .products![
                                                                              position]
                                                                          .id,
                                                                      remove:
                                                                          false);
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .black),
                                                                ),
                                                                child: const Icon(
                                                                    Icons
                                                                        .remove),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                drewProdcuctprice(
                                                    price: data[index]
                                                        .products![position]
                                                        .price)
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          drewtotal(context)
                        ],
                      ),
                    ))
            : Column(
                children: [
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      child: const OffLineScreen(),
                    ),
                  ),
                ],
              ),
      );
    } else {
      return LoadingScreen();
    }
  }
}
