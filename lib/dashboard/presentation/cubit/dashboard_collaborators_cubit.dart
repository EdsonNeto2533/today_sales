import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_colaborators_use_case.dart';

class DashboardCollaboratorsCubit {
  IGetColaboratorsUseCase getCollaboratorsUseCase;

  DashboardCollaboratorsCubit({required this.getCollaboratorsUseCase});

  Future<List<Collaborator>> getCollaborators() {
    return getCollaboratorsUseCase.getCollaborators();
  }
}
