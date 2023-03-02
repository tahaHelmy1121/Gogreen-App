import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:project/customwidget/constient/colors.dart';
import 'package:project/presntionlayer/view/auth/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Introduction>? getIntroductionPage({required BuildContext context}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return [
      Introduction(
        imageHeight: height*0.2,
        imageWidth: width*0.6,
          imageUrl: "assets/image/playstore.png",
          title: "Gogreen Store",titleTextStyle: TextStyle(fontSize: 25, color: Colors.black26,letterSpacing: 3),
          subTitle: "تسوق عبر متجر جو جرين" , subTitleTextStyle: TextStyle(fontSize: 14, color: Colors.grey,letterSpacing: 3),),
      Introduction(
        imageHeight: height*0.2,
        imageWidth: width*0.6,
        imageUrl: "assets/image/undraw_Order_delivered_re_v4ab.png",
        title: "Gogreen Store",titleTextStyle: TextStyle(fontSize: 25, color: Colors.black26,letterSpacing: 3),
        subTitle: "يحتوي متجر جوجريين علي تشكيلة مختلفة من الاثاثات",
        subTitleTextStyle: TextStyle(fontSize: 14, color: Colors.grey,letterSpacing: 3),
      ),
      Introduction(
        imageHeight: height*0.2,
        imageWidth: width*0.6,
          imageUrl: "assets/image/undraw_Empty_re_opql.png",
          title: "Gogreen Store",titleTextStyle: TextStyle(fontSize: 25, color: Colors.grey,letterSpacing: 3),
          subTitle: " توصيل متجر جوجريين عبر انحاء مصر",  subTitleTextStyle: TextStyle(fontSize: 14, color: Colors.grey,letterSpacing: 3),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: AppColor.whitecolor,
      introductionList: getIntroductionPage(context: context),
      onTapSkipButton: () {
        Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, widget) {
          return FadeTransition(
            opacity: animation,
            child: Login(),
          );
        }), (route) => false);
      },
    );
  }
}
