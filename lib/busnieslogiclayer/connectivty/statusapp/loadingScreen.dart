  import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

  class LoadingScreen extends StatefulWidget {
       const LoadingScreen({Key? key}) : super(key: key);

       @override
       State<LoadingScreen> createState() => _LoadingScreenState();
     }

     class _LoadingScreenState extends State<LoadingScreen> {
       @override
       Widget build(BuildContext context) {
         return  Scaffold(
           body : Center(
             child:Lottie.asset("assets/lotti/98194-loading.json")

           ),
         );
       }
     }
