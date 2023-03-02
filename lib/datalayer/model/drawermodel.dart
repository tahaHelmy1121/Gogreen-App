import 'package:flutter/material.dart';

class DrawerModel {
  String? title;
  Function? navigator;
  IconData? myIcon;
  BuildContext? context;


  DrawerModel({this.title, this.navigator,this.myIcon,this.context});
}
