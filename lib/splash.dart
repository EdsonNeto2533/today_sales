import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';
import 'package:today_sale/dashboard/presentation/ui/views/dashboard_screen.dart';

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
      _navigateToDasboard();
    });
  }

  Future<void> _initData() async {
    await GetIt.I.allReady();
  }

  void _navigateToDasboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return DashboardScreen();
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
            child: Image.asset("assets/images/app_banner.png"),
          ),
        ],
      ),
    );
  }
}
