import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../busnieslogiclayer/profile/profileprovider.dart';
import '../../../customwidget/style.dart';
import '../../widget/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    var hightScreen =MediaQuery.of(context).size.height;
    var widthScreen =MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "حسابى",
          style: GoogleFonts.alegreya(
              fontSize: 20, letterSpacing: 3, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.grey.shade500,
                Colors.green.shade800,
              ])),
        ),
        elevation: 0.9,
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProfileProvider(reader: context.read),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, top: 15),
                alignment: Alignment.topCenter,
                width: 250,
                height: 170,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 4,
                        )
                      ],
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/image/undraw_Profile_re_4a55.png"))),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                margin: EdgeInsets.only(left: 32,),
                width: widthScreen*0.9,
                height: hightScreen*0.7,
                child: Form(
                  key: context.read<ProfileProvider>().formPass,
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                 drewnameInput(width: widthScreen*0.1,height: widthScreen*0.8),
                      SizedBox(height: 12,),
                      drewEmailInput(height: hightScreen*0.2,width: widthScreen*0.9),
                      SizedBox(height: 12,),
                      drewMobileInput(height: hightScreen*0.1,width: widthScreen*0.8),
                      SizedBox(height: 12,),
                      drewPasswordInput(height:12, width: 12),
                      SizedBox(height: 18,),
                      drewElevatedButton(context)
                    ],
                  ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget drewnameInput({var height , width}){
    return  Container(
        child: TextFormField(
          style: const TextStyle(
              fontFamily: "BigVesta",
              fontSize: 14.0,
              color: Color(0xff16222A),
              fontWeight: FontWeight.w400),
          textDirection: TextDirection.rtl,
          controller: context.read<ProfileProvider>().textEditingControllerName,
          validator: (value) {
            if (value!.isEmpty) {
              return "أدخل الاسم";
            }
            return null;
          },
          keyboardType: TextInputType.text,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontFamily: "BigVesta"),
            hintText: "اسم المستخدم",

            hintStyle: GoogleFonts.almarai(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            filled: true,
          ),
        )

    );
  }
  Widget drewEmailInput(
      {required double height, required width}) {
  //  return Padding(
     // padding: EdgeInsets.all(height * .01),
     return Container(
       child: TextFormField(
          controller: context.read<ProfileProvider>().textEditingControllerEmail,
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
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.name,
          style: GoogleFonts.almarai(
              fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
          decoration:  InputDecoration(
            errorStyle:const TextStyle(
                fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
            hintText: "البريد الالكتروني",

            hintStyle: TextStyle(
              color: Colors.black,
            ),
            filled: true,
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            prefixIcon: Icon(Icons.email,color: Colors.green.shade900,),
          ),

    ),
     );
  }
  Widget drewMobileInput(
      {required double height, required width}) {
    return Padding(
      padding: EdgeInsets.all(height * .01),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller:context.read<ProfileProvider>().textEditingControllerPhone,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "أدخل رقم الهاتف ";
          }
          return null;
        },
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.phone,
        style: GoogleFonts.almarai(
            fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
        decoration:  InputDecoration(
          errorStyle:const TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
          hintText: "رقم الهاتف",
          hintStyle:const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: Icon(Icons.phone,color: Colors.green.shade900,),
        ),
      ),
    );
  }
  Widget drewPasswordInput(

      {required double height, required width}) {
    ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
    var password =context.watch<ProfileProvider>().textEditingControllerPassword;
    return Padding(
      padding: EdgeInsets.all(height * .01),
      child: ValueListenableBuilder(
        valueListenable: _obscurePassword,
        builder: (context, value, child)=>
      TextFormField(
          controller:password,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "أدخل كلمه المرور ";
            }
            return null;
          },
          obscureText: _obscurePassword.value,
          obscuringCharacter: "*",
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.name,
          style: GoogleFonts.almarai(
              fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
          decoration:  InputDecoration(
            errorStyle:const TextStyle(
                fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
            hintText: "كلمة المرور",
            hintStyle:const TextStyle(
              color: Colors.black,
            ),
            filled: true,
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            prefixIcon: IconButton(
              icon: Icon(
                _obscurePassword.value ?
                Icons.visibility_off:
                    Icons.visibility

              ),
              onPressed: () {
                _obscurePassword.value = !_obscurePassword.value;
              },
            ),
          ),
        ),
      ),
    );
  }
  Widget drewElevatedButton(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: ()  {
          context.read<ProfileProvider>().getProfileUpdate(context);
        },
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            "تعديل حسابي",
            style: CustomTitleStyle.customTitleStyle(
                color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }
}

