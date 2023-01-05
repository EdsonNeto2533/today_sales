import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_colaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_colaborators_use_case.dart';

class DashboardCollaboratorsCubit {
  IGetColaboratorsUseCase getCollaboratorsUseCase;
  IAddColaboratorsUseCase addColaboratorsUseCase;

  DashboardCollaboratorsCubit(
      {required this.getCollaboratorsUseCase,
      required this.addColaboratorsUseCase});

  Future<List<Collaborator>> getCollaborators() async {
    return await getCollaboratorsUseCase.getCollaborators();
  }

  Future<void> addColaborator() async {
    return addColaboratorsUseCase.addCollaborator(Collaborator(name: "joao"));
  }
}
