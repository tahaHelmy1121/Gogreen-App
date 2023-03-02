
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project/customwidget/constient/colors.dart';
import 'package:project/presntionlayer/view/auth/policecustom.dart';
import 'package:project/presntionlayer/view/auth/policewebview.dart';
import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/auth/registerprovider.dart';
import '../../../customwidget/style.dart';
import '../../../datalayer/model/auth/registermodel.dart';
import '../../../datalayer/model/auth/wevmodel/webmodel.dart';
import '../../widget/auth/drewimagescreen.dart';
import 'login.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstrain) {
      return Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(
          foregroundColor: AppColor.green,
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.whitecolor,
         // flexibleSpace: DrewTopScreenAuth(
            // title: "إنشاء الحساب",
            // height: boxConstrain.maxHeight * .15,
            // width: boxConstrain.maxWidth,
       //  ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
              create: (context) => RegisterProvider(context.read),
              child: DrewRegister(boxConstrain: boxConstrain)),
        ),
      );
    });
  }
}

class DrewRegister extends StatelessWidget {
  BoxConstraints? boxConstrain;

  DrewRegister({Key? key, this.boxConstrain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrewImageAuth(
          image: "assets/image/regis.png",
          height: boxConstrain!.maxHeight * .22,
          width: boxConstrain!.maxWidth,
        ),
        SizedBox(
          height: boxConstrain!.maxHeight * .03,
        ),
        Form(
          key: context
              .read<RegisterProvider>()
              .globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              drewNameInput(
                  context: context, height: boxConstrain!.maxHeight * .02),
              drewEmailInput(
                  context: context, height: boxConstrain!.maxHeight * .02),
              drewPhoneInput(
                  context: context, height: boxConstrain!.maxHeight * .02),
              drewPasswordInput(
                  context: context, height: boxConstrain!.maxHeight * .02),
            ],
          ),
        ),
        SizedBox(
          height: boxConstrain!.maxHeight * .03,
        ),
        drewPoliceView(context, boxConstrain!.maxHeight * .05,
            boxConstrain!.maxWidth - 60),
        SizedBox(
          height: boxConstrain!.maxHeight * .03,
        ),
        drewElevatedButton(context, boxConstrain!.maxHeight * .06,
            boxConstrain!.maxWidth - 50),
        SizedBox(
          height: boxConstrain!.maxHeight * .03,
        ),
        drewNotHaveEmail(context, boxConstrain!.maxHeight * .05,
            boxConstrain!.maxWidth - 60),
      ],
    );
  }

  Widget drewNameInput(
      {required double height, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(height * .50),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "أدخل الاسم ";
          }
          return null;
        },
        controller:
        context
            .watch<RegisterProvider>()
            .firstNameEditingController,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.name,
        style: GoogleFonts.almarai(
            fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
        decoration:  InputDecoration(
          errorStyle: TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
          hintText: "الاسم",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          prefixIcon: Icon(Icons.person,color: Colors.green.shade900),
        ),
      ),
    );
  }

  Widget drewEmailInput(
      {required double height, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(height * .50),
      child: TextFormField(
        validator: (String? value) {
          if (!RegExp(
              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
              .hasMatch(value!)) {
            return 'ادخل بريد صحيح';
          }
          else {
            return null;
          }
        },

        controller:
        context
            .watch<RegisterProvider>()
            .emailEditingController,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.almarai(
            fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
        decoration:  InputDecoration(
          errorStyle:const TextStyle(
            fontSize: 12,
            color: AppColor.redColor,
            fontWeight: FontWeight.bold,
          ),
          hintText: "البريد الالكتروني",
          hintStyle:const TextStyle(
            color: AppColor.grey,
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          prefixIcon: Icon(Icons.email_outlined,color: AppColor.green,),
        ),
      ),
    );
  }

  Widget drewPhoneInput(
      {required double height, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(height * .50),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "أدخل رقم الهاتف ";
          }
          return null;
        },
        controller:
        context
            .watch<RegisterProvider>()
            .phoneEditingController,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.phone,
        style: GoogleFonts.almarai(
            fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration:  InputDecoration(

          errorStyle: TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
          hintText: "رقم الهاتف",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          prefixIcon: Icon(Icons.phone,color: Colors.green.shade900),
        ),
      ),
    );
  }

  Widget drewPasswordInput(
      {required double height, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(height * .50),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'ادخل كلمه المرور ';
          }
          return null;
        },
        controller:
        context
            .watch<RegisterProvider>()
            .passEditingController,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.almarai(
            fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          errorStyle:  TextStyle(
              fontSize: 12,
              color: AppColor.redColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai'),
          hintText: "كلمة المرور",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget drewPoliceView( context, double height, double width) {
    return Container(
      margin: EdgeInsets.only(left: width * .30),
      alignment: Alignment.centerRight,
      height: height,
      width: width - 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              await Provider.of<RegisterProvider>(context, listen: false)
                  .getSetting();
              WebModel? data =
                  Provider
                      .of<RegisterProvider>(context, listen: false)
                      .webData;
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, animation, _) {
                    return FadeTransition(
                      opacity: animation,
                      child: (data!
                          .policyLink
                          .toString()
                          .isNotEmpty)
                          ? DrewWeb(
                        url: data.policyLink,
                      )
                          : PoliceCustom(webModel: data),
                    );
                  }));
            },
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "الشروط والاحكام",
                  style: CustomTitleStyle.customTitleStyle(
                      size: 12, color: AppColor.green),
                )),
          ),
          SizedBox(
            width: width * .01,
          ),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "اوافق علي ",
                style: CustomTitleStyle.customTitleStyle(size: 14),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * .02),
            child: Transform.scale(
              scale: height * .06,
              child: Consumer<RegisterProvider>(
                  builder: (context, registerViewModel, widget) {
                    return Checkbox(
                      value: registerViewModel.isChecked,
                      onChanged: (value) {
                        registerViewModel.isChecked = value ?? true;
                      },
                      checkColor: Colors.white,
                      hoverColor: Colors.green.shade50,
                      fillColor: MaterialStateProperty.all(Colors.green),
                      splashRadius: width * .04,
                      shape: CircleBorder(),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget drewElevatedButton(BuildContext context, double height, double width) {
    RegisterModel? registerModel;
    return SizedBox(
      height: 40,
      width: 220,
      child: MaterialButton(
          elevation: 5,
          color: Colors.green,
          disabledColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * .05)),
          child: Text(
            "إنشاء حساب",
            style: CustomTitleStyle.customTitleStyle(
                size: 18, color: Colors.white),
          ),
          onPressed: context
              .read<RegisterProvider>()
              .isChecked == true
              ? () async {
            if (context
                .read<RegisterProvider>()
                .globalKey
                .currentState!
                .validate()) {
              String name = context
                  .read<RegisterProvider>()
                  .firstNameEditingController.text;
              String email = context
                  .read<RegisterProvider>()
                  .emailEditingController.text;
              String pass = context
                  .read<RegisterProvider>()
                  .passEditingController.text;
              String mobile = context
                  .read<RegisterProvider>()
                  .phoneEditingController.text;

              registerModel = await context
                  .read<RegisterProvider>()
                  .regstier(
                context
              );
            }
          }
              : null),
    );
  }

  Widget drewNotHaveEmail(BuildContext context, double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, animation, _) {
                    return FadeTransition(
                      opacity: animation,
                      child: const Login(),
                    );
                  }));
            },
            child: Container(
              height: height,
              width: width/3,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "تسجيل الدخول ",
                  textDirection: TextDirection.rtl,
                  style: CustomTitleStyle.customTitleStyle(
                      color: Colors.green, size: 14),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              " لديك حساب ؟",
              textDirection: TextDirection.rtl,
              style: CustomTitleStyle.customTitleStyle(
                  color: Colors.black, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}
