import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import '../../../customwidget/constient/colors.dart';
import '../../../customwidget/style.dart';
import '../../../datalayer/model/auth/wevmodel/webmodel.dart';
class PoliceCustom extends StatelessWidget {
  WebModel webModel;

  PoliceCustom({Key? key, required this.webModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(
          foregroundColor:AppColor.green,
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.whitecolor,
          title: Text(
            "الشروط والاحكام",
            style: CustomTitleStyle.customTitleStyle(
                color: AppColor.green, size: 16),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: boxConstraints.maxHeight * .05,
              width: boxConstraints.maxWidth * .60,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  webModel.introduction.toString(),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              height: boxConstraints.maxHeight * .05,
              width: boxConstraints.maxWidth ,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(left: boxConstraints.minWidth*.27,right:boxConstraints.minWidth*.01 ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  webModel.introduction1.toString(),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:const  TextStyle(
                    decoration: TextDecoration.underline,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      color: AppColor.black),
                ),
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(boxConstraints.minWidth*.01),
                    child: Text(
                      webModel.conditions.toString(),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: boxConstraints.maxHeight * .20,
                child: ClipPath(
                  clipper: SinCosineWaveClipper(
                      verticalPosition: VerticalPosition.top),
                  child: Container(
                    height: boxConstraints.maxHeight / 4,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff334d50), Color(0xffcbcaa5)])),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
