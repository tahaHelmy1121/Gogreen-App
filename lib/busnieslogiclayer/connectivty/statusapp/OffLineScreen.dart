import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class OffLineScreen extends StatelessWidget {
  const OffLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height:250,
        width:250,
        child:Lottie.asset("assets/lotti/wifi.json")
        ),

    );
  }
}
