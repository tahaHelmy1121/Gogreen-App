import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/customwidget/constient/colors.dart';

import 'package:project/presntionlayer/view/auth/login.dart';
import 'package:project/presntionlayer/view/onboarding/onboarding.dart';
import 'package:project/presntionlayer/view/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  getCustomerTypeNav(BuildContext context) async {
    SharedPreferences _sharedPreferences =
    await SharedPreferences.getInstance();
    int? _typeValue = _sharedPreferences.getInt("customerType");
    if (_typeValue==0||_typeValue==null) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const OnBoarding(),
              );
            }), (route) => false),
      );
    } else if (_typeValue == 1) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context,animation,_) {
              return FadeTransition(
                opacity: animation,
                child:  HomePage(),
              );
            }), (route) => false),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const ProfilePage(), //TODO delgetepage
              );
            }), (route) => false),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerTypeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,BoxConstraints boxConstraint) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: boxConstraint.maxHeight,
          child: Column(
            children: [
              SizedBox(height: boxConstraint.maxHeight*.35,),
              Container(
                alignment: Alignment.center,
                height: boxConstraint.maxHeight*.10,
                width: boxConstraint.maxWidth,
                child: FittedBox(
                  fit: (boxConstraint.maxWidth > 450)
                      ? BoxFit.cover
                      : BoxFit.scaleDown,
                  child: Text(
                    "Go Green ",
                    style: TextStyle(
                        fontFamily: "Ultra",
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: AppColor.green),
                  ),
                ),
              ),
              SizedBox(height: boxConstraint.maxHeight*.05,),
              Container(
                alignment: Alignment.center,
                height: boxConstraint.maxHeight*.50,
                width: boxConstraint.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                        "assets/image/istockphoto-1207983874-612x612.jpg",
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
