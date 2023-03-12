library dashboard;

import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/views/dashboard_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initialBaseRoute,
            child: (_, __) => DashboardScreen())
      ];
}
