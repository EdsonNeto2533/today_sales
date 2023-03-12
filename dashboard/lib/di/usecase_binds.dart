import 'package:dashboard/dashboard_feature/presentation/usecase/iadd_collaborators_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/usecase/iremove_colaborator_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dashboard_feature/domain/usecase/add_collaborator_use_case.dart';
import '../dashboard_feature/domain/usecase/get_collaborators_use_case.dart';
import '../dashboard_feature/domain/usecase/remove_collaborator_use_case.dart';
import '../dashboard_feature/presentation/usecase/iget_collaborators_use_case.dart';

List<Bind> useCaseBinds = [
  Bind.factory<IAddCollaboratorsUseCase>(
    (i) => AddCollaboratorsUseCase(
      repository: i.get(),
    ),
  ),
  Bind.factory<IGetCollaboratorsUseCase>(
    (i) => GetCollaboratorsUseCase(
      repository: i.get(),
    ),
  ),
  Bind.factory<IRemoveCollaboratorUseCase>(
    (i) => RemoveCollaboratorUseCase(
      repository: i.get(),
    ),
  ),
];
