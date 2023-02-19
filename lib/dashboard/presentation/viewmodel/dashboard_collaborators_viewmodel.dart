import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/commons/utils/interfaces/ui_state.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_collaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_collaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iremove_colaborator_use_case.dart';

class DashboardCollaboratorsViewModel {
  final IGetCollaboratorsUseCase _getCollaboratorsUseCase;
  final IAddCollaboratorsUseCase _addColaboratorsUseCase;
  final IRemoveCollaboratorUseCase _removeCollaboratorUseCase;

  ValueNotifier<UIState<List<Collaborator>>> collaboratorListState =
      ValueNotifier(Loading());

  DashboardCollaboratorsViewModel(
      {required IGetCollaboratorsUseCase getCollaboratorsUseCase,
      required IAddCollaboratorsUseCase addColaboratorsUseCase,
      required IRemoveCollaboratorUseCase removeCollaboratorUseCase})
      : _addColaboratorsUseCase = addColaboratorsUseCase,
        _getCollaboratorsUseCase = getCollaboratorsUseCase,
        _removeCollaboratorUseCase = removeCollaboratorUseCase;

  Future<List<Collaborator>> getCollaborators() async {
    return await _getCollaboratorsUseCase.getCollaborators();
  }

  Future<void> addColaborator(String collaboratorName) async {
    return await _addColaboratorsUseCase
        .addCollaborator(Collaborator(name: collaboratorName));
  }

  Future<void> removeCollaborator(Collaborator collaborator) async {
    return await _removeCollaboratorUseCase.removeColaborator(collaborator);
  }
}