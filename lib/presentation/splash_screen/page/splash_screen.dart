import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investynn/core/config/routes/route_name.dart';
import 'package:investynn/core/const/app_assets.dart';
import 'package:investynn/core/const/color_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    context.go(RouteName.getStarted);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primary300,
      child: Center(child: Image.asset(AppAssets.logo)),
    );
  }
}
