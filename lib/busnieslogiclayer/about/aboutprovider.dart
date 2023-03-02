import 'package:flutter/material.dart';
import '../../datalayer/model/about/aboutModel.dart';
import '../../datalayer/repostory/about/aboutRepo.dart';

class AboutProvider extends ChangeNotifier {
  AboutProvider() {
    getPagesFromRepo();
  }
  List<AboutModel>? _pages = [];

  List<AboutModel>? get pages => _pages;

  set pages(List<AboutModel>? value) {
    _pages = value;
  }

  bool _loading = false;


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  getPagesFromRepo ()async{
    _pages =await AboutRepo.getAbout();
    _loading =true;
    notifyListeners();
  }
}
