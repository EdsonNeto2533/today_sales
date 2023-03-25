import 'package:dashboard/dashboard_feature/presentation/viewmodel/dashboard_collaborators_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<Bind> viewModelBinds = [
  Bind.factory(
    (i) => DashboardCollaboratorsViewModel(
      getCollaboratorsUseCase: i.get(),
      addColaboratorsUseCase: i.get(),
      removeCollaboratorUseCase: i.get(),
    ),
  )
];
