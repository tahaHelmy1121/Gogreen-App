import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:project/busnieslogiclayer/auth/forgetprovider.dart';
import 'package:provider/provider.dart';
import '../../../customwidget/constient/colors.dart';
import '../../../customwidget/style.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetProvider(context.read, context.read),
      child: LayoutBuilder(
        builder: (context, BoxConstraints boxConstraints) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "هل نسيت كلمة السر",
              style: CustomTitleStyle.customgoogleStyle(),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(gradient: AppColor.appBarGradient),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ], borderRadius: BorderRadius.circular(70)),
                  margin: const EdgeInsets.only(left: 18, top: 18),
                  alignment: Alignment.topCenter,
                  width: boxConstraints.maxWidth*0.4,
                  height: boxConstraints.maxHeight*0.2,
                  child: Lottie.asset(
                      "assets/lotti/16766-forget-password-animation.json"),
                ),
                const SizedBox(height: 18,),
                Form(
                  key: context.watch<ForgetProvider>().formPass,
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    height: 100,
                    width: boxConstraints.maxWidth*0.9,
                    child: TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      textDirection: TextDirection.rtl,
                      controller: context
                          .watch<ForgetProvider>()
                          .textEditingControllerForgetPass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل رقم الهاتف";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "رقم الهاتف",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                      ),
                    ),
                  ),

                ),
                const SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppColor.appBarGradient
                  ),
                  height: boxConstraints.maxHeight*0.1/2,
                  width: boxConstraints.maxWidth*0.4,
                  child: MaterialButton(
                    child: Text(
                      "ارسال البريد ",
                      style: CustomTitleStyle.customTitleStyle(
                          size: 16, color: AppColor.grey),
                    ),

                    onPressed: () {
                      context.read<ForgetProvider>().forgetPass(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
