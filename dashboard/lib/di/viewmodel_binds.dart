import 'package:dashboard/dashboard_feature/domain/usecase/add_collaborator_use_case.dart';
import 'package:dashboard/dashboard_feature/domain/usecase/get_collaborators_use_case.dart';
import 'package:dashboard/dashboard_feature/domain/usecase/remove_collaborator_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/usecase/iadd_collaborators_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/usecase/iget_collaborators_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/usecase/iremove_colaborator_use_case.dart';
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
