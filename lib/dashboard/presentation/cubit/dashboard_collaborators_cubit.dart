import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_colaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_colaborators_use_case.dart';

class DashboardCollaboratorsCubit {
  final IGetColaboratorsUseCase _getCollaboratorsUseCase;
  final IAddColaboratorsUseCase _addColaboratorsUseCase;

  DashboardCollaboratorsCubit(
      {required getCollaboratorsUseCase, required addColaboratorsUseCase})
      : _addColaboratorsUseCase = addColaboratorsUseCase,
        _getCollaboratorsUseCase = getCollaboratorsUseCase;

  Future<List<Collaborator>> getCollaborators() async {
    return await _getCollaboratorsUseCase.getCollaborators();
  }

  Future<void> addColaborator() async {
    return await _addColaboratorsUseCase
        .addCollaborator(Collaborator(name: "joao"));
  }
}
