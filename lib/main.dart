import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wemax_project/splashscreen.dart';
import 'Bottom_nav_Screen/home.dart';
import 'Provider/allprovider.dart';
import 'bottom_nav_bar.dart';
 void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AllProductProvider(),),
    ChangeNotifierProvider(create: (context) => AllElectroniProductProvider(),),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const BottomNavigationBarScreen(),
      builder: EasyLoading.init(),
    ),
    );
  }
}
