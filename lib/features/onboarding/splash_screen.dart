import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      checkOnboarding();
    });
  }

  Future<void> checkOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool(ISFIRSTTIME) ?? false;

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, homeLayout);
    } else {
      Navigator.pushReplacementNamed(context, onboarding);
    }
  }

  @override
  void dispose() {
    debugPrint('close splash screen');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('------build');
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(child: Lottie.asset('assets/animations/Cooking.json')),
    );
  }
}
