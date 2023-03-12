import 'package:dashboard/dashboard_feature/data/repository/dashboard_repository.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<Bind> repositoryBinds = [
  Bind.factory<IDashboardRepository>(
    (i) => DashboardRepository(
      collaboratorDAO: i.get(),
    ),
  )
];
