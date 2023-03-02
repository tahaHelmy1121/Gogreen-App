
import 'package:flutter/material.dart';
import 'package:project/presntionlayer/view/auth/register.dart';
import 'package:provider/provider.dart';
 import 'dart:io';
import '../../../busnieslogiclayer/auth/loginprovider.dart';
import '../../../busnieslogiclayer/themeChanger/themechanger.dart';
import '../../../customwidget/style.dart';
import '../../widget/auth/customimage.dart';
import '../cart/iconview.dart';
import 'forgetPasword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        leading: CartIcon(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => LoginProvider(context.read, context.read),
        child: const DrawLoginScreen(),
      ),
    );
  }
}

class DrawLoginScreen extends StatelessWidget {
  const DrawLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
    var widthScreen = MediaQuery.of(context).size.width;
    var hightScreen = MediaQuery.of(context).size.height;
    return Form(
      key: context.read<LoginProvider>().globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomImageAuth(),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              style: const TextStyle(
                  fontFamily: "BigVesta",
                  fontSize: 14.0,
                  color: Color(0xff16222A),
                  fontWeight: FontWeight.w400),
              textDirection: TextDirection.rtl,
              controller: context.read<LoginProvider>().phoneEditingController,
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
                hintText:"ادخل رقم الهاتف",
                hintStyle: const TextStyle(
                    fontFamily: "BigVesta",
                    fontSize: 14.0,
                    color: Color(0xff16222A),
                    fontWeight: FontWeight.w400),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) => TextFormField(
                obscureText: _obscurePassword.value,
                obscuringCharacter: "*",
                style: const TextStyle(
                    fontFamily: "BigVesta",
                    fontSize: 14.0,
                    color: Color(0xff16222A),
                    fontWeight: FontWeight.w400),
                textDirection: TextDirection.rtl,
                controller:
                    context.read<LoginProvider>().passwrordEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "كلمة المرور";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    child: _obscurePassword.value
                        ? const Icon(Icons.visibility_off_sharp)
                        : const Icon(Icons.visibility),
                    onTap: () {
                      _obscurePassword.value = !_obscurePassword.value;
                    },
                  ),
                  errorStyle: const TextStyle(fontFamily: "BigVesta"),
                  hintText: "ادخل كلمه المرور ",
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
            drewForget(
                context: context,
                height: hightScreen * 0.1,
                width: widthScreen * 0.7),
            drewElevatedButton(context),
            drewNotHaveEmail(
                context: context,
                height: hightScreen * 0.1,
                width: widthScreen * 0.5),
            RadioListTile<ThemeMode>(
                title: const Text("DarkMode"),
                value: ThemeMode.dark,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme),
            RadioListTile<ThemeMode>(
                title: const Text("lightMode"),
                value: ThemeMode.light,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme),
            RadioListTile<ThemeMode>(
                title: const Text("systemMode"),
                value: ThemeMode.system,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme),

          ],
        ),
      ),
    );
  }

  Widget drewForget({required BuildContext context, double? height, width}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const ForgetPasswordView(),
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 90, top: 12),
        alignment: Alignment.topLeft,
        height: height,
        width: width / 1,
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "هل نسيت كلمه المرور؟",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14,
                color: Colors.green),
          ),
        ),
      ),
    );
  }

  Widget drewElevatedButton(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          if (context
              .read<LoginProvider>()
              .globalKey
              .currentState!
              .validate()) {
            String user =
                context.read<LoginProvider>().phoneEditingController.text;
            String pass =
                context.read<LoginProvider>().passwrordEditingController.text;
            await context.read<LoginProvider>().getLoginFromRepo(
                userName: user, password: pass, context: context, deviceId: 2);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 220,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Text("تسجيل الدخول", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget drewNotHaveEmail(
      {required BuildContext context, double? height, double? width}) {
    return Container(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child:  RegisterView(),
                );
              }));
            },
            child: Container(
              height: height,
              width: width! / 3,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "إنشاء حساب جديد ",
                  textDirection: TextDirection.rtl,
                  style: CustomTitleStyle.customTitleStyle(
                      color: Colors.green, size: 14),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * .02,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "ليس لديك حساب ؟",
              textDirection: TextDirection.rtl,
              style: CustomTitleStyle.customTitleStyle(
                  color: Colors.black, size: 12),
            ),
          ),
        ],
      ),
    );
  }
}
