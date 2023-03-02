import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/busnieslogiclayer/cart/cartprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/model/cart/addcart.dart';
import '../../datalayer/model/categorymodel/categorymodel.dart';
import '../../datalayer/repostory/cart/addtocart.dart';
import '../../datalayer/repostory/category/categoryrepo.dart';
import '../../presntionlayer/view/auth/login.dart';
class HomePageProvider extends ChangeNotifier {
  final Locator reader;

  BuildContext? context;

  HomePageProvider({required this.reader, this.context}) {
    getCategory();
  }

  List<CategoryModel>? _myCategoryData = [];
 // late List<CategoryModel> searchedForCharacters;
 // bool _isSearching = false;
 // final _searchTextController = TextEditingController();
  List<CategoryModel>? get myCategoryData => _myCategoryData;

  set myCategory(List<CategoryModel>? value) {
    _myCategoryData = value;
  }

  bool? _catLoading = false;

  bool? get catLoading => _catLoading;

  set catLoading(bool? value) {
    _catLoading = value;
  }

  SharedPreferences? _sharedPreferences;

  getCategory() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getInt("customerId");

    _myCategoryData = await CategoryRepoistory.getcategoryRepo(customer: customer);

    _catLoading = true;

    notifyListeners();
  }

  addCart({required  context, itemIndex, productId, remove,index}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences!.getInt("customerId") == null ||
        _sharedPreferences!.getInt("customerId") == 0) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'حدث خطاء',
        desc: 'يجب تسجيل الدخول للاضافه الي السلة',
        btnOkText: "تسجيل دخول",
        btnOkColor: const Color(0xff3f762f),
        btnCancelText: "إلغاء",
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: const Login(),
                );
              },
            ),
          );
        },
      )..show();
    } else {
      var qun = _myCategoryData![index].products![itemIndex].cartquantity;
      if (remove) {
        _myCategoryData![index].products![itemIndex].cartquantity++;
        qun = _myCategoryData![index].products![itemIndex].cartquantity;
      } else {
        if (_myCategoryData![index].products![itemIndex].cartquantity > 0) {
          _myCategoryData![index].products![itemIndex].cartquantity--;
          qun = _myCategoryData![index].products![itemIndex].cartquantity;
        }
      }

      var customer;
      AddCartModel? _add;
      customer = (_sharedPreferences!.getInt("customerId"))!;
      if (qun >= 0) {
        _add = await AddCartRepo.addCart(
          customerId: customer,
          productId: myCategoryData![index].products![itemIndex].id,
          quantity: qun,
        );
        notifyListeners();
        reader<CartProvider>().getCart(context);

      }
    }
  }
}
