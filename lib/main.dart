import 'package:flutter/material.dart';
import 'package:today_sale/commons/di/depencies.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';
import 'package:today_sale/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    registerDepencies();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ManageUTheme.appTheme,
        home: SplashScreen());
  }
}
