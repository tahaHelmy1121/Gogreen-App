import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/busnieslogiclayer/drawer/drawerprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../busnieslogiclayer/drawer/drawerprovider.dart';


class CustomDrawer extends StatelessWidget {
  double containerHeight = 0.0;
  double containerWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    bool? customer = context.watch<DrawerProvider>().customerHear;
    var name = context.watch<DrawerProvider>().name;
    return Container(
      height: heightScreen * .90,
      width: widthScreen * .70,
      child: LayoutBuilder(builder: (context, constrain) {
        containerHeight = constrain.maxHeight;
        containerWidth = constrain.maxWidth;
        return Drawer(
          surfaceTintColor: Colors.black,
          shadowColor: Colors.grey.shade500,
          elevation:4 ,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: Colors.grey.shade400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              drewFirstLayer(height: containerHeight, width: containerWidth),
              Column(
                children: [
                  customer == true
                      ? drewHeaderDrawer(
                          height: containerHeight * .09,
                          width: containerWidth,
                          context: context,
                          userName: name)
                      : SizedBox(
                          height: containerHeight * .09,
                        ),
                  drewBody(
                      height: containerHeight * .80,
                      width: containerWidth * .80,
                      context: context),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget drewFirstLayer({double? height, width}) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(height! * .02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * .03),
        color: Colors.white,
      ),
    );
  }

  Widget drewHeaderDrawer({double? height, width, var context, userName}) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
          top: height! / 2,
          right: width * .10,
          bottom: width * .10,
          left: width * .10),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black54,
            width: width * .0050,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Container(
              alignment: Alignment.center,
              width: width * .60,
              height: height,
              child: Text(
                userName.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: GoogleFonts.sansita(fontSize: 20),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Padding(
              padding: EdgeInsets.all(width * .06),
              child: Container(
                width: width * .20,
                height: height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            ExactAssetImage("assets/image/icons8-user-80.png"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drewBody({double? height, width, required BuildContext context}) {
    return Container(
      height: height,
      width: width,
      child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: height! * .001),
              child: ListTile(
                  leading: Icon(context
                      .read<DrawerProvider>()
                      .drawerViewModel![position]
                      .myIcon),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      context
                          .watch<DrawerProvider>()
                          .drawerViewModel![position]
                          .title
                          .toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  onTap: () async {
                    if (context
                            .read<DrawerProvider>()
                            .drawerViewModel![position]
                            .title
                            .toString() ==
                        'تسجيل الخروج') {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.clear();
                      Phoenix.rebirth(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                        return FadeTransition(
                          opacity: animation,
                          child: context
                              .watch<DrawerProvider>()
                              .drawerViewModel![position]
                              .navigator!(),
                        );
                      }));
                    }
                  }),
            );
          },
          itemCount: context.watch<DrawerProvider>().drawerViewModel!.length),
    );
  }
}
