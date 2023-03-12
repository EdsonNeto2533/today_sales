import 'package:commons/commons.dart';
import 'package:commons/utils/theme/app_theme.dart';
import 'package:dashboard/dashboard_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onboarding/onboarding_module.dart';
import 'package:today_sale/splash_screen/splash.dart';

void main() {
  runApp(ModularApp(
    module: MainModule(),
    child: const MainAppWidget(),
  ));
}

class MainModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialBaseRoute,
          child: (context, args) => const SplashScreen(),
        ),
        ModuleRoute(
          AppRoutes.onboardingModuleRoute,
          module: OnboardingModule(),
        ),
        ModuleRoute(
          AppRoutes.dashboardModuleRoute,
          module: DashboardModule(),
        )
      ];
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manage U',
      theme: ManageUTheme.appTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
