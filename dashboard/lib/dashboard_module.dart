library dashboard;

import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/views/collaborator_details_page.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/views/dashboard_screen.dart';
import 'package:dashboard/di/repository_binds.dart';
import 'package:dashboard/di/usecase_binds.dart';
import 'package:dashboard/di/viewmodel_binds.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    ...repositoryBinds,
    ...useCaseBinds,
    ...viewModelBinds
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialBaseRoute,
          child: (_, __) => DashboardScreen(
            dashboardBloc: Modular.get(),
          ),
        ),
        ChildRoute(
          AppRoutes.collaboratorDetailsInternalRoute,
          child: (_, args) => CollaboratorDetailsPage(
            collaboratorId: int.parse(
              args.params["id"],
            ),
          ),
        )
      ];
}
