import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var hightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      width: widthScreen * 0.7,
      height: hightScreen * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/image/undraw_Access_account_re_8spm (1).png")),
      ),
    );
  }
}
