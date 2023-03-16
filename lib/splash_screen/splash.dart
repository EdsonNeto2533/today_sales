import 'dart:async';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initModular();
  }

  void _initModular() async {
    _initData();
    Timer(const Duration(seconds: 3), () {
      _navigateToOnboarding();
    });
  }

  Future<void> _initData() async {
    await Modular.isModuleReady();
  }

  void _navigateToOnboarding() {
    Modular.to.pushReplacementNamed(AppRoutes.onboardingModuleRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManageUTheme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.appBanner),
          ),
        ],
      ),
    );
  }
}
