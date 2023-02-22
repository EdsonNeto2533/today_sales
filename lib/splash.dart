import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';
import 'package:today_sale/dashboard/presentation/ui/views/dashboard_screen.dart';
import 'package:today_sale/onboarding/presentation/ui/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initGetIt();
  }

  void _initGetIt() async {
    _initData();
    Timer(const Duration(seconds: 5), () {
      _navigateToOnboarding();
    });
  }

  Future<void> _initData() async {
    await GetIt.I.allReady();
  }

  void _navigateToOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const OnboardingScreen();
      }),
    );
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
