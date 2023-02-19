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
      ValueNotifier(LoadingUIState());

  DashboardCollaboratorsViewModel(
      {required IGetCollaboratorsUseCase getCollaboratorsUseCase,
      required IAddCollaboratorsUseCase addColaboratorsUseCase,
      required IRemoveCollaboratorUseCase removeCollaboratorUseCase})
      : _addColaboratorsUseCase = addColaboratorsUseCase,
        _getCollaboratorsUseCase = getCollaboratorsUseCase,
        _removeCollaboratorUseCase = removeCollaboratorUseCase;

  void getCollaborators() async {
    collaboratorListState.value = LoadingUIState();
    try {
      var collaboratorList = await _getCollaboratorsUseCase.getCollaborators();
      collaboratorListState.value = SuccessUIState(collaboratorList);
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }

  void addColaborator(String collaboratorName) async {
    try {
      await _addColaboratorsUseCase
          .addCollaborator(Collaborator(name: collaboratorName));
      getCollaborators();
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }

  void removeCollaborator(Collaborator collaborator) async {
    try {
      await _removeCollaboratorUseCase.removeColaborator(collaborator);
      getCollaborators();
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }
}
