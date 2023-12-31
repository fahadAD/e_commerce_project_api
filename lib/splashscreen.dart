import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wemax_project/Authentication/signin.dart';

import 'Authentication/signup.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Lottie.asset("assets/lottie.json",
            )),
         const SizedBox(height: 30,),
         const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
