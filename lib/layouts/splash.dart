import 'dart:async';
import 'package:Tasbih/layouts/home.dart';
import 'package:Tasbih/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(provider.getBG()),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Center(
          child: Image.asset(
            "assets/images/splash_logo.png",
            width: 250.w,
            height: 250.h,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
