

import 'package:flutter/material.dart';


class ThemeChanger extends ChangeNotifier{
   var _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  void setTheme (themeMode){
    _themeMode = themeMode;
    notifyListeners();

  }

}
