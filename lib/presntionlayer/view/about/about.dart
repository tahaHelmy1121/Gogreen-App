import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../busnieslogiclayer/about/aboutprovider.dart';
import '../../../customwidget/constient/colors.dart';
import '../../../customwidget/style.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../widget/drawer.dart';
class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loading = context.watch<AboutProvider>().loading;
    var data = context.watch<AboutProvider>().pages;
    return ChangeNotifierProvider(
      create: (context) => AboutProvider(),
      child: Scaffold(
        endDrawer: CustomDrawer(),
        backgroundColor: AppColor.grey,
        appBar: AppBar(
            foregroundColor: AppColor.black,
            centerTitle: true,
            backgroundColor:AppColor.whitecolor,
            title: Text(
              "عنا",
              style: CustomTitleStyle.customTitleStyle(
                  size: 18, color:AppColor.black),
            )),
        //  endDrawer: CustomDrawer(),
        body: loading == true
            ? SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 350,
                    alignment: Alignment.center,
                    child: Text(
                      "${data![0].name}",
                      style: CustomTitleStyle.customTitleStyle(
                          size: 18, color: AppColor.green),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CachedNetworkImage(
                      height: 70,
                      width: 170,
                      imageUrl: data[0].image.toString(),
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Shimmer(
                        gradient: const LinearGradient(
                            colors: [AppColor.black, AppColor.whitecolor]),
                        child: Container(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Html(data: data[0].describe),
                  ),
                ],
              ))
            :  Center(
                child:Lottie.asset("assets/lotti/98194-loading.json")
              ),
      ),
    );
  }
}
