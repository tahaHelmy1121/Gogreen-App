import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:project/busnieslogiclayer/address/addressProvider.dart';
import 'package:project/busnieslogiclayer/cart/cartprovider.dart';
import 'package:project/busnieslogiclayer/drawer/drawerprovider.dart';
import 'package:project/busnieslogiclayer/profile/profileprovider.dart';
import 'package:project/presntionlayer/view/auth/login.dart';
import 'package:project/presntionlayer/view/delegete/delegateview.dart';
import 'package:project/presntionlayer/view/order/order.dart';
import 'package:project/presntionlayer/view/profile/profile.dart';
import 'package:project/presntionlayer/view/splash/splash.dart';
import 'package:provider/provider.dart';
import 'busnieslogiclayer/about/aboutprovider.dart';
import 'busnieslogiclayer/category/categoryprovider.dart';
import 'busnieslogiclayer/checkInternetConnectIntenet/checkinternetconectivity.dart';
import 'busnieslogiclayer/connectivty/statusinternet/status.dart';
import 'busnieslogiclayer/order/orderprovider.dart';
import 'busnieslogiclayer/themeChanger/themechanger.dart';


void main() async {
  runApp(Phoenix(
    child: App(),
  ));

  WidgetsFlutterBinding.ensureInitialized();
 // await EasyLocalization.ensureInitialized();
 // EasyLocalization(
   // supportedLocales: [
    //  Locale("en", "Us"),
    //  Locale("ar", "AR"),
   // ],
   // path: "assets/lang",
   // saveLocale: true,

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
 // static final String title = 'Localization';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (context) => NetworkServices().controller.stream,
            initialData: NetworkStatus.online),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(
            create: (_) =>
                HomePageProvider(reader: context.read, context: context)),
        ChangeNotifierProvider(
            create: (context) => CartProvider(context, context.read)),
        ChangeNotifierProvider(
            create: (context) => ProfileProvider(reader: context.read)),
        ChangeNotifierProvider(create: (context) => AboutProvider()),
        ChangeNotifierProvider(
            create: (context) => AddressProvider(context.read)),
        ChangeNotifierProvider(
            create: (context) => DrawerProvider(context: context)),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        // ChangeNotifierProvider(
        // create: (context) => LocaleProvider(),)
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
       //   locale: Locale("ar"),
          debugShowCheckedModeBanner: false,
          //    locale: context.watch<LocaleProvider>().locale,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: SplashView(),
        );
      }),
    );
  }
}
