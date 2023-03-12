library onboarding;

import 'package:commons/commons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onboarding/onboarding_screens/presentation/ui/views/onboarding_screen.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialBaseRoute,
          child: (_, __) => const OnboardingScreen(),
        )
      ];
}
