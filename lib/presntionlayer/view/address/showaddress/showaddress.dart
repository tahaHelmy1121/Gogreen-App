
import 'package:lottie/lottie.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../customwidget/style.dart';
import '../../../widget/drawer.dart';
import '../edit/edit.dart';


class ShowAddressView extends StatelessWidget {
  const ShowAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddressProvider(context.read),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            return DrewFirstLayer(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
            );
          }),
    );
  }
}

class DrewFirstLayer extends StatelessWidget {
  var height, width;

  DrewFirstLayer({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.maps_ugc_sharp),
            onPressed: () {
              context
                  .read<AddressProvider>()
                  .floatActionAddAddress(context);
            }),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text("عرض العناوين",style: CustomTitleStyle.customgoogleStyle(),),
        ),

        body: RefreshIndicator(
          displacement: 1,
          color: Colors.green,
          strokeWidth: 5,
          triggerMode:
          RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 1,
          onRefresh: ()async{
          return  await context.read<AddressProvider>().showAddress();
          },
          child: DrewShowAddress(
            width: width,
            height: height,
          ),
        ));
  }
}

class DrewShowAddress extends StatelessWidget {
  var height, width;

  DrewShowAddress({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressShow = context.watch<AddressProvider>().address;
    return context.watch<AddressProvider>().lod == true
        ? Container(
      height: height,
      width: width,
      child: addressShow!.isNotEmpty
          ? ListView.builder(
          itemCount: addressShow.length,
          itemBuilder: (context, position) {
            return Container(
              height: height * .30,
              width: width,
              child: Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(width * .02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<AddressProvider>()
                                    .removeAddress(
                                id: addressShow[position].id,
                                context: context);
                              },
                              icon: Image.asset(
                                "assets/image/icons8-remove-64.png",
                                height: height * .03,
                                width: width * .05,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: ()  {
                                Navigator.push(context,
                                    PageRouteBuilder(pageBuilder:
                                        (context,animation, _) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: EditAddressView(addressOne: addressShow[position]),
                                      );
                                    }));
                              },
                              icon: Image.asset(
                                "assets/image/icons8-edit-64.png",
                                height: height * .03,
                                width: width * .05,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * .04,
                            width: width * .60,
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "${addressShow[position].governorateName} - ${addressShow[position].regionName} - ${addressShow[position].districtName}",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: width * .40,
                            child: Text(
                              "رقم العماره: ${addressShow[position].streetAddress.toString()}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: width * .40,
                            child: Text(
                              "رقم الدور : ${addressShow[position].roleNumber.toString()}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: width * .40,
                            child: Text(
                              "علامه مميزة: ${addressShow[position].specialMarque.toString()}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
          : Center(
          child:Container(
            width: 250,
            height: 250,
           child: Lottie.asset("assets/lotti/shop2.json"),
          )
      )
    )
        : const Center(
      child: CircularProgressIndicator(color: Colors.green),
    );
  }
}
