import 'dart:async';

import 'package:commons/utils/constants/app_images.dart';
import 'package:commons/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../onboarding_screens/presentation/ui/views/onboarding_screen.dart';

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
    await Modular.isModuleReady();
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
