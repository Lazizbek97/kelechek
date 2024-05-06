import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        HomeScreen.route(),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AppImagePaths.appIcon,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
