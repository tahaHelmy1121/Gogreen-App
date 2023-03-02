import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/customwidget/constient/massage.dart';
import 'package:project/presntionlayer/view/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/model/cart/addcart.dart';
import '../../datalayer/model/cart/cartmodel.dart';
import '../../datalayer/model/cart/removecartmodel.dart';
import '../../datalayer/repostory/cart/addtocart.dart';
import '../../datalayer/repostory/cart/iconcartrepo.dart';
import '../../datalayer/repostory/cart/removecartrepo.dart';
import '../../presntionlayer/view/cart/cartshow.dart';

class CartProvider extends ChangeNotifier {
  BuildContext context;
  final Locator reader;

  CartProvider(this.context, this.reader) {
    getCart(context);
  }

  CartModel? _cartModel =CartModel();

  CartModel? get cartModel => _cartModel;
  bool _load = false;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  RemoveCartModel? _removeCartModel = RemoveCartModel();

  RemoveCartModel? get removeCartModel => _removeCartModel;
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;
  AddCartModel? _add;

  AddCartModel? get add => _add;

  getCart( context) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
   var  customer = sharedPreferences.getInt("customerId");
    _cartModel = await IconCartRepo.getTotalCartRepo(customerId: customer);
    load = true;
    notifyListeners();
  }

  tapIcon( context) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    var customer = sharedPreferences.getInt("customerId");
    if (customer == null) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.leftSlide,
        title: "",
        desc:"",
        btnOkText: "",
        btnCancelText:"",
        btnCancelOnPress: () {},
        btnOkColor: const Color(0xff3f762f),
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
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation,widget) {
            return FadeTransition(
              opacity: animation,
              child:const Cart(),

            );

          },

        ),
      );
    }

  }
  @override
  notifyListeners();
  addCart(
      {required  context,
        itemIndex,
        productId,
        remove,
        colorId,
        productColorId,
        colorName,
        sizeName}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences!.getInt("customerId") == null ||
        _sharedPreferences!.getInt("customerId") == 0) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title:"",
        desc: "",
        btnOkText: "",
        btnOkColor: const Color(0xff3f762f),
        btnCancelText:"",
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
      var qun = _cartModel!.products![itemIndex].quantity;
      if (remove) {
        _cartModel!.products![itemIndex].quantity++;
        qun = _cartModel!.products![itemIndex].quantity;
        notifyListeners();
      } else {
        if (_cartModel!.products![itemIndex].quantity > 0) {
          _cartModel!.products![itemIndex].quantity--;
          qun = _cartModel!.products![itemIndex].quantity;
        }
        notifyListeners();
      }

      int
      customer = (_sharedPreferences!.getInt("customerId"))!;

      if (qun >= 0) {
        _add = await AddCartRepo.addCart(
            customerId: customer,
            productId: _cartModel!.products![itemIndex].productId,
            quantity: qun);


      }
      _cartModel = await IconCartRepo.getTotalCartRepo(customerId: customer);

      notifyListeners();
    }
  }

  removeCart({var index, customer}) async {
    _removeCartModel = await RemoveCartRepo.removeCartRepo(id: index);

    if (_removeCartModel!.status == 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            _removeCartModel!.reason.toString(),
            style: const TextStyle(fontFamily: "Almarai"),
          ),
          duration: const Duration(seconds: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          elevation: 10,
        ));

      _cartModel = await IconCartRepo.getTotalCartRepo(customerId: customer);
      notifyListeners();
    } else {
      MassageApp.flusherBarErrorMassage(context,_removeCartModel!.reason,"", (flushbar) {


      });
      notifyListeners();
    }
  }
}
